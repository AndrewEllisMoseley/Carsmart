import 'package:app/models/vehicle.dart';
import 'package:app/styles/styles.dart';
import 'package:app/widgets/custom_header.dart';
import 'package:app/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class VehicleDetailsPage extends StatelessWidget {
  const VehicleDetailsPage({Key key, this.vehicle}) : super(key: key);

  final Vehicle vehicle;

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
      body: SafeArea(
        minimum: EdgeInsets.all(16.0),
        child: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  width: 200.0,
                  height: 120.0,
                  child: Image.asset('lib/assets/merc.png'),
                ),
                CustomText(
                  text: vehicle.salesdesignation,
                  textColour: kBlackText,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  alignment: Alignment.center,
                ),
                SizedBox(height: 30.0),
                Container(
                  margin: EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: [
                          CustomText(
                            text: 'Model',
                            fontSize: 16.0,
                          ),
                          CustomText(
                            text: 'E 400',
                            fontSize: 26.0,
                            textColour: kBlackText,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          CustomText(
                            text: 'Year',
                            fontSize: 16.0,
                          ),
                          CustomText(
                            text: vehicle.modelyear,
                            fontSize: 26.0,
                            textColour: kBlackText,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Divider(
                  color: kLightGreyText,
                ),
                Container(
                  margin: EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: [
                          CustomText(
                            text: 'Fuel',
                            fontSize: 16.0,
                          ),
                          CustomText(
                            text: vehicle.fueltype,
                            fontSize: 26.0,
                            textColour: kBlackText,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          CustomText(
                            text: 'Power',
                            fontSize: 16.0,
                          ),
                          CustomText(
                            text: vehicle.powerhp + 'bhp',
                            fontSize: 26.0,
                            textColour: kBlackText,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Divider(
                  color: kLightGreyText,
                ),
                Container(
                  margin: EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: [
                          CustomText(
                            text: 'Mileage',
                            fontSize: 16.0,
                          ),
                          CustomText(
                            text: '6,456',
                            fontSize: 26.0,
                            textColour: kBlackText,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          CustomText(
                            text: 'Distance away',
                            fontSize: 16.0,
                          ),
                          CustomText(
                            text: '2.1m',
                            fontSize: 26.0,
                            textColour: kBlackText,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
