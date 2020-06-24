import 'package:app/config/settings.dart';
import 'package:app/models/vehicle.dart';
import 'package:app/models/vehicle_location.dart';
import 'package:app/models/vehicle_odometer.dart';

import 'api_service.dart';

// ------------------------------------------------------------------------
// Class: Mercedes Service
// Description: This class interacts with all Mercedes Developer API
// endpoints in order to gather the information related to the vehicle
// ------------------------------------------------------------------------
class MercedesService with HttpService {
  // ------------------------------------------------------------------------
  // Method that gets the vehicle details
  // ------------------------------------------------------------------------
  Future<Vehicle> getVehicle(String vehicleID) async {
    await Future.delayed(Duration(seconds: 3));
    dynamic vehicleDetails =
        await httpGetWithBearer('$mercedesBaseURL$vehicleID', '$accessToken');
    return Vehicle.fromJson(vehicleDetails);
  }

  // ------------------------------------------------------------------------
  // Method that gets the location of the vehicle
  // ------------------------------------------------------------------------
  Future<VehicleLocation> getLocation(String vehicleID) async {
    dynamic vehicleLocation = await httpGetWithBearer(
        '$mercedesBaseURL$vehicleID/location', '$accessToken');
    return VehicleLocation.fromJson(vehicleLocation);
  }

  // ------------------------------------------------------------------------
  // Method that gets a static map of where the vehicle is located based
  // off its longitude and latitude
  // ------------------------------------------------------------------------
  Future<dynamic> getStaticMap(dynamic longitude, dynamic latitude) async {
    return await httpGet('$mapBaseURL$marker$longitude,$latitude$key');
  }

  // ------------------------------------------------------------------------
  // Method that gets the vehicle odometer readings
  // ------------------------------------------------------------------------
  Future<dynamic> getOdometerReading(vehicleID) async {
    Future.delayed(Duration(seconds: 2));
    dynamic odometerReading = await httpGetWithBearer(
        '$mercedesBaseURL$vehicleID$odometer', '$accessToken');
    return VehicleOdometer.fromJson(odometerReading);
  }

  // ------------------------------------------------------------------------
  // Method that gets an image of the vehicle in question
  // ------------------------------------------------------------------------
  Future<dynamic> getImage() async {
    await Future.delayed(Duration(seconds: 3));
    String imageCode =
        'https://api.mercedes-benz.com/tryout/vehicle_images/v1/images/V0REMjEzMjIzMUE0NDQ1NTY6cm9vZk9wZW49ZmFsc2U6bmlnaHQ9ZmFsc2U6RVhUMzMwLnBuZw%3D%3D?apikey=8a13da6c-ff14-1de4-46f8-21acaee53966';
    return await httpGetWithImage(imageCode);
  }

  // ------------------------------------------------------------------------
  // Method that sets the lock status for the vehicle doors
  // ------------------------------------------------------------------------
  Future<dynamic> setLockStatus(String vehicleID, dynamic command) async {
    String url =
        'https://api.mercedes-benz.com/experimental/connectedvehicle/v1/vehicles/$vehicleID/doors';
    return await httpPostWithBearer(url, '$accessToken', command);
  }
}

MercedesService mercedesService = new MercedesService();
