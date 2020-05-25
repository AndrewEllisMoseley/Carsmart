from django.core.mail import send_mail
from django.db import models
from django.contrib.auth.models import AbstractUser
from django.utils.translation import ugettext_lazy as _, override


class User(AbstractUser):
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

    username = models.CharField(max_length=30, blank=True, null=True)
    email = models.EmailField(_('email address'), unique=True)
    job = models.CharField(_('job'), max_length=15, choices=JOB_CHOICES)
    company = models.CharField(_('company'), max_length=3, choices=COMPANY_CHOICES)

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['username', 'first_name', 'last_name', 'company', 'job']

    def __str__(self):
        return "{}".format(self.email)

    def pretty_job(self):
        """
        Returns pretty job name
        """
        job = [row[1] for row in self.JOB_CHOICES if row[0] == self.job]
        if job:
            return job[0]
        return ''

    def pretty_company(self):
        """
        Returns pretty company name
        """
        company = [row[1] for row in self.COMPANY_CHOICES if row[0] == self.company]
        if company:
            return company[0]
        return ''

    @override
    def email_user(self, subject, message, from_email='ellis.moseley1984@gmail.com', **kwargs):
        """
        Sends an email to this User.
        """
        send_mail(subject, message, from_email, [self.email], **kwargs)
