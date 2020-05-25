import 'package:app/constants/settings.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class VehicleMap extends StatelessWidget {
  final double longitude;
  final double latitude;

  VehicleMap({@required this.longitude, @required this.latitude});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {},
      child: FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: '$mapBaseURL$marker$latitude,$longitude$key',
      ),
    );
  }
}
