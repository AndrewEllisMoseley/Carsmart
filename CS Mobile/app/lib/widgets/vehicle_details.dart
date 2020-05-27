import 'package:app/models/user.dart';
import 'package:app/models/vehicle.dart';
import 'package:app/styles/styles.dart';
import 'package:app/widgets/custom_button.dart';
import 'package:app/widgets/hero_header.dart';
import 'package:app/widgets/registration_box.dart';
import 'package:app/widgets/vehicle.dart';
import 'package:app/widgets/vehicle_map.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'custom_text.dart';

class VehicleDetails extends StatefulWidget {
  VehicleDetails({@required this.vehicle, this.user});

  final Vehicle vehicle;
  //TODO Remove user
  final User user;
  @override
  _VehicleDetailsState createState() => _VehicleDetailsState();
}

class _VehicleDetailsState extends State<VehicleDetails> {
  // bool _isLoading = false;
  // dynamic vehicleMap;
  // _getVehicleDetails() async {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   // vehicleImage = await mercedesService.getImage();
  //   setState(() {
  //     _isLoading = false;
  //   });
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _getVehicleDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Material(
            elevation: 10.0,
            color: kWhiteText,
            child: Container(
              height: widget.vehicle != null
                  ? MediaQuery.of(context).size.height * 0.70
                  : MediaQuery.of(context).size.height * 0.80,
              width: double.infinity,
              color: Colors.white,
              child: widget.user.firstName == 'Super'
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
            child:
                widget.user.firstName == 'Super' ? VehicleMap() : Container(),
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
            vehicle: widget.vehicle,
            modelYear: widget.vehicle.modelyear,
          ),
          RegistrationBox(
            registration: widget.vehicle.licenseplate,
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
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                        fontSize: 17.0,
                        textColour: kSecondaryColour,
                        left: 30.0,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      CustomButton(
                        width: 200.0,
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
