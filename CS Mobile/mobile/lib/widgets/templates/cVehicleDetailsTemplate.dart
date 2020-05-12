import 'package:flutter/material.dart';
import 'package:mobile/screens/vehicle/vehicle_location.dart';

import 'package:mobile/styles/constants.dart';
import 'package:mobile/widgets/molecules/cHero.dart';
import 'package:mobile/widgets/molecules/cRegistrationBox.dart';
import 'package:mobile/widgets/molecules/cVehicleDetails.dart';

class CVehicleDetailsTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: <Widget>[
          Material(
            elevation: 10.0,
            color: kWhiteText,
            child: Container(
              margin: EdgeInsets.fromLTRB(20.0, 10, 20.0, 0),
              height: MediaQuery.of(context).size.height * 0.68,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CHero(
                    text: 'Good news. You\'re vehicle has been assigned',
                  ),
                  CVehicleDetails(),
                  CRegistrationBox(
                    registration: 'CF69 SDK',
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: kBlackText,
                ),
                BoxShadow(
                  color: kBlackText,
                  spreadRadius: -200.0,
                  blurRadius: 12.0,
                ),
              ],
            ),
            child: RawMaterialButton(
              child: Image.asset('lib/assets/map.jpg'),
              onPressed: () {
                Navigator.push<dynamic>(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (context) => VehicleLocationPage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
