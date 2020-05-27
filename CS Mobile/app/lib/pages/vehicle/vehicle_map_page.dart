import 'package:app/styles/styles.dart';
import 'package:app/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class VehicleMapPage extends StatefulWidget {
  @override
  _VehicleMapPageState createState() => _VehicleMapPageState();
}

class _VehicleMapPageState extends State<VehicleMapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteBacground,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        title: Material(
          color: kWhiteBacground,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: CustomText(
              text: 'Back',
              fontSize: 26.0,
              textColour: kPrimaryColour,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          child: Text('Vehicle Map Here'),
        ),
      ),
    );
  }
}
