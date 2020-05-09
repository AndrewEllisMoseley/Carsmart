import requests
from rest_framework import serializers
from vehicle.models import Vehicle


class VehicleSerializer(serializers.HyperlinkedModelSerializer):

    class Meta:
        model = Vehicle
        fields = ('registration_number', 'description', 'vin', 'model_year', 'colour', 'fuel_type', 'power_hp',
                  'number_of_doors', 'number_of_seats', 'associated_user')

    def create(self, validated_data):
        vehicle_data = validated_data.pop('vehicle')
        vehicle = Vehicle(**validated_data)
        vehicle.save()
        Vehicle.objects.create(vehicle=vehicle, **vehicle_data)
        return vehicle

    def update(self, instance, validated_data):
        vehicle_data = validated_data.pop('vehicle')
        vehicle = instance.vehicle

        vehicle.registration_number = vehicle_data.get('registration_number', vehicle.registration_number)
        vehicle.description = vehicle_data.get('description', vehicle.description)
        vehicle.vin = vehicle_data.get('vin', vehicle.vin)
        vehicle.model_year = vehicle_data.get('model_year', vehicle.model_year)
        vehicle.colour = vehicle_data.get('colour', vehicle.colour)
        vehicle.fuel_type = vehicle_data.get('fuel_type', vehicle.fuel_type)
        vehicle.power_hp = vehicle_data.get('power_hp', vehicle.power_hp)
        vehicle.number_of_doors = vehicle_data.get('number_of_doors', vehicle.number_of_doors)
        vehicle.number_of_seats = vehicle_data.get('number_of_seats', vehicle.number_of_seats)
        vehicle.save()

        return instance
