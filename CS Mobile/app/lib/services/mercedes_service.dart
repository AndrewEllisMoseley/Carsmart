import 'package:app/constants/settings.dart';
import 'package:app/models/vehicle.dart';
import 'package:app/models/vehicle_location.dart';

import 'api_service.dart';

class MercedesService with HttpService {
  Future<Vehicle> getVehicle() async {
    await Future.delayed(Duration(seconds: 1));
    dynamic vehicleDetails = await httpGetWithBearer(
        '$mercedesBaseURL$dummyVehicleID', '$dummyBearerToken');
    return Vehicle.fromJson(vehicleDetails);
  }

  Future<VehicleLocation> getLocation() async {
    dynamic vehicleLocation = await httpGetWithBearer(
        '$mercedesBaseURL$dummyVehicleID/location', '$dummyBearerToken');
    return VehicleLocation.fromJson(vehicleLocation);
  }

  Future<dynamic> getStaticMap(dynamic long, dynamic lat) async {
    print('url: $mapBaseURL$marker$long,$lat$key');
    dynamic staticMap = await httpGet('$mapBaseURL$marker$long,$lat$key');
    print('state map $staticMap');
    return staticMap;
  }

  Future<dynamic> getImage() async {
    await Future.delayed(Duration(seconds: 3));
    String imageURL =
        'https://api.mercedes-benz.com/tryout/vehicle_images/v1/vehicles/WME4534911K444556?perspective=EXT330&roofOpen=false&night=false&background=false&apikey=8a13da6c-ff14-1de4-46f8-21acaee53966';
    String imageCode =
        'https://api.mercedes-benz.com/tryout/vehicle_images/v1/images/V0REMjEzMjIzMUE0NDQ1NTY6cm9vZk9wZW49ZmFsc2U6bmlnaHQ9ZmFsc2U6RVhUMzMwLnBuZw%3D%3D?apikey=8a13da6c-ff14-1de4-46f8-21acaee53966';
    dynamic vehicleImage = await httpGetWithImage(imageCode);
    print('image $vehicleImage');
    return vehicleImage;
  }
}

MercedesService mercedesService = new MercedesService();
