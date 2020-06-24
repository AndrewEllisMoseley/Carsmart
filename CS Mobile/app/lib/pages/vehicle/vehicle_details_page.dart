import 'package:app/models/vehicle.dart';
import 'package:app/models/vehicle_odometer.dart';
import 'package:app/services/mercedes_service.dart';
import 'package:app/styles/styles.dart';
import 'package:app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class VehicleDetailsPage extends StatefulWidget {
  const VehicleDetailsPage({Key key, this.vehicle}) : super(key: key);

  final Vehicle vehicle;

  @override
  _VehicleDetailsPageState createState() => _VehicleDetailsPageState();
}

class _VehicleDetailsPageState extends State<VehicleDetailsPage> {
  VehicleOdometer vehicleOdometer;
  bool _isLoading = true;
  Future<dynamic> _getOdometerReading() async {
    dynamic reading =
        await mercedesService.getOdometerReading('4FD2C33C609D5B8F96');
    setState(() {
      vehicleOdometer = reading;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getOdometerReading();
  }

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
      body: _isLoading == true
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SpinKitDoubleBounce(
                    color: kSecondaryColour,
                    size: 100.0,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  CustomText(
                    text: 'Getting vehcile details',
                    fontSize: 20.0,
                    textColour: kTertiaryColour,
                    alignment: Alignment.center,
                  ),
                ],
              ),
            )
          : SafeArea(
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
                        text: widget.vehicle.salesdesignation,
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
                                  text: widget.vehicle.modelyear,
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
                                  text: widget.vehicle.fueltype,
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
                                  text: widget.vehicle.powerhp + 'bhp',
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
                                  text:
                                      vehicleOdometer.reading.toString() + 'm',
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
