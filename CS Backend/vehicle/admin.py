from django.contrib import admin
from .models import Vehicle


# Register your models here.
class VehicleAdmin(admin.ModelAdmin):
    pass


admin.site.register(Vehicle, VehicleAdmin)
