import uuid

from django.db import models
from django.core.mail import send_mail
from django.contrib.auth.models import AbstractUser
from django.utils.translation import ugettext_lazy as _
from django.conf import settings


class Account(AbstractUser):
    username = models.CharField(max_length=30, blank=True, null=True)
    email = models.EmailField(_('email address'), unique=True)

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['username', 'first_name', 'last_name']

    def __str__(self):
        return "{}".format(self.email)


class AccountProfile(models.Model):
    TITLE_CHOICES = (
        ('mr', 'MR'),
        ('mrs', 'MRS'),
        ('miss', 'Miss'),
        ('ms', 'MS'),
        ('mx', 'Mx'),
    )

    JOB_CHOICES = (
        ('receptionist', 'Receptionist'),
        ('accountant', 'Accountant'),
        ('operations', 'Operations'),
        ('quality', 'Quality Control'),
        ('supervisor', 'Supervisor'),
        ('marketing', 'Marketing'),
        ('purchasing', 'Purchasing'),
        ('software', 'Software Engineer'),
        ('support', 'I.T. Support'),
        ('management', 'Management'),
        ('safety', 'Safety and Environmental'),
    )

    COMPANY_CHOICES = (
        ('AGL', 'Admiral Group'),
        ('AA', 'AA Insurance'),
        ('VEY', 'Veygo'),
    )

    STATUS_TYPES = (
        ('A', 'Authorized'),
        ('P', 'Pending'),
        ('R', 'Rejected'),
        ('V', 'Revoked'),
    )

    uuid = models.UUIDField(_('uuid'), primary_key=True, default=uuid.uuid4, editable=False)
    user = models.OneToOneField(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='account')
    title = models.CharField(_('title'), max_length=4, choices=TITLE_CHOICES, blank=True)
    first_name = models.CharField(_('first name'), max_length=50)
    middle_name = models.CharField(_('middle_name'), max_length=50, blank=True, null=True)
    last_name = models.CharField(_('last name'), max_length=50)
    date_of_birth = models.DateField(_('date of birth'), null=True)
    phone_number = models.CharField(_('phone number'), max_length=12, blank=True, null=True)
    job = models.CharField(_('job'), max_length=15, choices=JOB_CHOICES, blank=True)
    company = models.CharField(_('company'), max_length=3, choices=COMPANY_CHOICES)
    status = models.CharField(_('status'), max_length=1, choices=STATUS_TYPES, default='P')
    admin = models.BooleanField(_('admin'), default=False)
    avatar = models.ImageField(_('avatar'), upload_to='avatars/', null=True, blank=True)
    created_date = models.DateTimeField(_('created date'), auto_now_add=True)
    modified_date = models.DateTimeField(_('modified date'), auto_now_add=True)

    def get_full_name(self):
        """
        Returns the first_name plus the last_name, with a space in between.
        """
        full_name = '%s %s' % (self.first_name, self.last_name)
        return full_name.strip()

    def get_short_name(self):
        """
        Returns the short name for the user.
        """
        return self.first_name

    def get_short_uuid(self) -> str:
        """
        Returns the short uuid for user
        """
        return str(self.uuid)[:5]

    def pretty_title(self):
        """
        Returns pretty title name
        """
        title = [row[1] for row in AccountProfile.TITLE_CHOICES if row[0] == self.title]
        if title:
            return title[0]
        return ''

    def pretty_job(self):
        """
        Returns pretty job name
        """
        job = [row[1] for row in AccountProfile.JOB_CHOICES if row[0] == self.job]
        if job:
            return job[0]
        return ''

    def pretty_company(self):
        """
        Returns pretty company name
        """
        company = [row[1] for row in AccountProfile.COMPANY_CHOICES if row[0] == self.company]
        if company:
            return company[0]
        return ''

    def pretty_status(self):
        """
        Returns pretty status name
        """
        status = [row[1] for row in AccountProfile.STATUS_TYPES if row[0] == self.status]
        if status:
            return status[0]
        return ''

    def email_user(self, subject, message, from_email=None, **kwargs):
        """
        Sends an email to this User.
        """
        send_mail(subject, message, from_email, [self.email], **kwargs)
