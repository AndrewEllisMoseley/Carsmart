import 'package:app/constants/settings.dart';
import 'package:app/models/vehicle.dart';
import 'package:app/models/vehicle_location.dart';
import 'package:app/services/mercedes_service.dart';
import 'package:app/styles/styles.dart';
import 'package:app/widgets/custom_button.dart';
import 'package:app/widgets/hero_header.dart';
import 'package:app/widgets/registration_box.dart';
import 'package:app/widgets/vehicle.dart';
import 'package:app/widgets/vehicle_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'custom_text.dart';

class VehicleDetails extends StatefulWidget {
  @override
  _VehicleDetailsState createState() => _VehicleDetailsState();
}

class _VehicleDetailsState extends State<VehicleDetails> {
  bool _isLoading = false;
  Vehicle vehicle = new Vehicle();
  VehicleLocation vehicleLocation = new VehicleLocation();
  Vehicle vehicleData;
  VehicleLocation vehicleLoc;
  dynamic vehicleMap;
  _getVehicleDetails() async {
    setState(() {
      _isLoading = true;
    });
    vehicleData = await mercedesService.getVehicle();
    // vehicleImage = await mercedesService.getImage();
    vehicleLoc = await mercedesService.getLocation();
    setState(() {
      vehicle = vehicleData;
      vehicleLocation = vehicleLoc;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getVehicleDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
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
                    text: 'We\'ve found your details',
                    fontSize: 20.0,
                    textColour: kTertiaryColour,
                    alignment: Alignment.center,
                  ),
                  CustomText(
                    text: 'Checking for any vehicles',
                    fontSize: 20.0,
                    textColour: kTertiaryColour,
                    alignment: Alignment.center,
                  ),
                ],
              ),
            )
          : ListView(
              children: <Widget>[
                Material(
                  elevation: 10.0,
                  color: kWhiteText,
                  child: Container(
                    height: vehicle != null
                        ? MediaQuery.of(context).size.height * 0.70
                        : MediaQuery.of(context).size.height * 0.80,
                    width: double.infinity,
                    color: Colors.white,
                    child: vehicle != null
                        ? _vehicleAssigned()
                        : _noVehicleAssigned(),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: kBlackText,
                      ),
                      BoxShadow(
                        color: kGreyText,
                        spreadRadius: 0.1,
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  child: vehicle != null
                      ? VehicleMap(
                          longitude: vehicleLocation.longitude,
                          latitude: vehicleLocation.latitude,
                        )
                      : null,
                ),
              ],
            ),
    );
  }

  Widget _vehicleAssigned() {
    return SafeArea(
      minimum: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeroHeader(
            text: 'Good news. You\'re vehicle has been assigned',
          ),
          Vehicles(
            description: vehicle.salesdesignation,
            model: vehicle.modelyear,
          ),
          RegistrationBox(
            registration: vehicle.licenseplate,
          ),
        ],
      ),
    );
  }

  Widget _noVehicleAssigned() {
    return SafeArea(
      minimum: const EdgeInsets.all(16),
      child: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              HeroHeader(
                text: 'You don\'t currently have a vehicle assigned',
              ),
              Expanded(
                child: Container(
                  constraints: BoxConstraints.expand(),
                  padding: EdgeInsets.fromLTRB(30, 70, 30, 30),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.robot,
                        color: kSecondaryColour,
                        size: 50.0,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      CustomText(
                        text:
                            'You can still request a vehicle, just click the request button below!',
                        alignment: Alignment.center,
                        fontSize: 26.0,
                        textColour: kSecondaryColour,
                        left: 30.0,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      CustomButton(
                        text: 'Request Vehicle',
                        onPressCallback: () {},
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
