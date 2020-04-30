import uuid

from django.db import models
from django.contrib.auth.models import AbstractUser
from django.utils.translation import ugettext_lazy as _
from django.conf import settings


class Vehicle(models.Model):
    DOORS_CHOICES = (
        ('1', '1 Door'),
        ('2', '2 Door'),
        ('3', '3 Door'),
        ('4', '4 Door'),
        ('5', '5 Door'),
    )

    SEAT_CHOICES = (
        ('1', 'Single Seater'),
        ('2', '2 Seater'),
        ('3', '3 Seater'),
        ('4', '4 Seater'),
        ('5', '5 Seater'),
        ('6', '6 Seater'),
        ('7', '7 Seater'),
        ('8', '8 Seater'),
        ('9', '9 Seater'),
        ('10', '10 Seater'),
    )

    uuid = models.UUIDField(_('uuid'), primary_key=True, default=uuid.uuid4, editable=False)
    vehicle_id = models.CharField(_('vehicle id'), unique=True, max_length=20, editable=False)
    registration = models.CharField(_('registration'), max_length=10, editable=False)
    description = models.CharField(_('description'), max_length=50)
    vin = models.CharField(_('vin'), max_length=20)
    model_year = models.CharField(_('model year'), max_length=4)
    colour = models.CharField(_('colour'), max_length=25)
    fuel_type = models.CharField(_('fuel type'), max_length=10)
    power_hp = models.CharField(_('power hp'), max_length=4)
    number_of_doors = models.CharField(_('number of doors'), max_length=1, choices=DOORS_CHOICES)
    number_of_seats = models.CharField(_('number of seats'), max_length=2, choices=SEAT_CHOICES)

    associated_user = models.OneToOneField(settings.AUTH_USER_MODEL, on_delete=models.CASCADE,
                                           related_name='associated_user')
    created_date = models.DateTimeField(_('created date'), auto_now_add=True)
    modified_date = models.DateTimeField(_('modified date'), auto_now_add=True)

    def get_short_uuid(self) -> str:
        """
        Returns the short uuid for user
        """
        return str(self.uuid)[:5]

    def pretty_number_of_doors(self):
        """
        Returns pretty title name
        """
        doors = [row[1] for row in Vehicle.DOORS_CHOICES if row[0] == self.number_of_doors]
        if doors:
            return doors[0]
        return ''

    def pretty_number_of_seats(self):
        """
        Returns pretty job name
        """
        seats = [row[1] for row in Vehicle.SEAT_CHOICES if row[0] == self.number_of_seats]
        if seats:
            return seats[0]
        return ''
