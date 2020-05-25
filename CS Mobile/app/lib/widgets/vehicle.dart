import 'package:app/models/vehicle.dart';
import 'package:app/pages/vehicle/vehicle_details_page.dart';
import 'package:app/styles/styles.dart';
import 'package:app/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class Vehicles extends StatelessWidget {
  Vehicles({@required this.vehicle, this.modelYear});

  final Vehicle vehicle;
  final String modelYear;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CustomText(
                text: 'Your Car',
                textColour: kPrimaryColour,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
              Material(
                child: InkWell(
                  child: CustomText(
                    text: 'Details',
                  ),
                  onTap: () {
                    Navigator.push<dynamic>(
                      context,
                      MaterialPageRoute<dynamic>(
                        builder: (context) => VehicleDetailsPage(
                          vehicle: vehicle,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Center(
            child: Column(
              children: <Widget>[
                Container(
                  width: 200.0,
                  height: 200.0,
                  child: Image.asset('lib/assets/merc.png'),
                ),
                CustomText(
                  text: vehicle.salesdesignation,
                  textColour: kBlackText,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  alignment: Alignment.center,
                ),
                CustomText(
                  text: 'Model Year: $modelYear',
                  alignment: Alignment.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
