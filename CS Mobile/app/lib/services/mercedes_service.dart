import 'package:app/constants/settings.dart';

import 'api_service.dart';

class MercedesService with HttpService {
  Future<dynamic> getLocation() async {
    dynamic vehicleDetails = await httpGetWithBearer(
        '$mercedesBaseURL$dummyVehicleID', '$dummyBearerToken');
    print(vehicleDetails);
    return vehicleDetails;
  }
}

MercedesService mercedesService = new MercedesService();
