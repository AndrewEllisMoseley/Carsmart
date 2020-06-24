import 'package:app/config/settings.dart';
import 'package:app/models/vehicle_location.dart';
import 'package:app/pages/vehicle/vehicle_map_page.dart';
import 'package:app/services/mercedes_service.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class VehicleMap extends StatefulWidget {
  @override
  _VehicleMapState createState() => _VehicleMapState();
}

class _VehicleMapState extends State<VehicleMap> {
  VehicleLocation vehicleLocation = new VehicleLocation();
  VehicleLocation vehicleLoc;
  dynamic vehicleMap;
  _getVehicleLocation() async {
    vehicleLoc = await mercedesService.getLocation('4FD2C33C609D5B8F96');
    setState(() {
      vehicleLocation = vehicleLoc;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getVehicleLocation();
  }

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        Navigator.push<dynamic>(
          context,
          MaterialPageRoute<dynamic>(
            builder: (context) => VehicleMapPage(),
          ),
        );
      },
      child: FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image:
            '$mapBaseURL$marker${vehicleLocation.latitude},${vehicleLocation.longitude}$key',
      ),
    );
  }
}
