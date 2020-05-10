import 'dart:async';

import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:mobile/styles/constants.dart';
import 'package:mobile/widgets/atoms/cHeader.dart';
import 'package:mobile/widgets/templates/cVehicleDetailsTemplate.dart';

class VehicleDetailsPage extends StatelessWidget {
  const VehicleDetailsPage({Key key}) : super(key: key);

  static Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: CHeader(
          text: 'Overview',
        ),
        backgroundColor: kWhiteText,
        elevation: 0.0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 20, 10),
            child: IconButton(
              icon: Icon(
                Icons.account_circle,
                color: kPrimaryColour,
                size: 45.0,
              ),
              onPressed: () {
                // do something
              },
            ),
          )
        ],
      ),
      body: CVehicleDetailsTemplate(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 75,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                color: kLightGreyText,
                iconSize: 30.0,
                padding: EdgeInsets.only(left: 28.0),
                icon: Icon(Icons.notifications),
                onPressed: () {},
              ),
              IconButton(
                color: kPrimaryColour,
                iconSize: 30.0,
                padding: EdgeInsets.only(left: 0.0),
                icon: Icon(Icons.view_headline),
                onPressed: () {},
              ),
              IconButton(
                color: kLightGreyText,
                iconSize: 30.0,
                padding: EdgeInsets.only(right: 28.0),
                icon: Icon(Icons.card_travel),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
