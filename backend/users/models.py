from __future__ import unicode_literals

import uuid
from django.db import models
from django.core.mail import send_mail
from django.contrib.auth.models import PermissionsMixin
from django.contrib.auth.base_user import AbstractBaseUser
from django.utils.translation import ugettext_lazy as _

from .managers import UserManager


class User(AbstractBaseUser, PermissionsMixin):

    COMPANY = (
        ('AGL', 'Admiral Group'),
        ('AA', 'AA Insurance'),
        ('VEY', 'Veygo'),
    )

    STATUS = (
        ('A', 'Authorized'),
        ('P', 'Pending'),
        ('R', 'Rejected'),
        ('V', 'Revoked'),
    )

    uuid = models.UUIDField(_('uuid'), primary_key=True, default=uuid.uuid4, editable=False)
    first_name = models.CharField(_('first name'), max_length=30)
    last_name = models.CharField(_('last name'), max_length=30)
    company = models.CharField(_('company'), max_length=3, choices=COMPANY)
    email = models.EmailField(_('email address'), unique=True)
    status = models.CharField(_('status'), max_length=1, choices=STATUS, default='P')
    admin = models.BooleanField(_('admin'), default=False)
    avatar = models.ImageField(upload_to='avatars/', null=True, blank=True)
    created_date = models.DateTimeField(_('created date'), auto_now_add=True)
    modified_date = models.DateTimeField(_('modified date'), auto_now_add=True)

    objects = UserManager()

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []

    class Meta:
        verbose_name = _('user')
        verbose_name_plural = _('users')

    def get_full_name(self):
        '''
        Returns the first_name plus the last_name, with a space in between.
        '''
        full_name = '%s %s' % (self.first_name, self.last_name)
        return full_name.strip()

    def get_short_name(self):
        '''
        Returns the short name for the user.
        '''
        return self.first_name

    def get_short_uuid(self) -> str:
        '''
        Returns the short uuid for user
        '''
        return str(self.uuid)[:5]

    def pretty_company(self):
        '''
        Returns pretty company name
        '''
        company = [row[1] for row in User.COMPANY if row[0] == self.company]
        if company:
            return company[0]
        return ''

    def pretty_status(self):
        '''
        Returns pretty status name
        '''
        status = [row[1] for row in User.STATUS if row[0] == self.status]
        if status:
            return status[0]
        return ''

    def email_user(self, subject, message, from_email=None, **kwargs):
        '''
        Sends an email to this User.
        '''
        send_mail(subject, message, from_email, [self.email], **kwargs)