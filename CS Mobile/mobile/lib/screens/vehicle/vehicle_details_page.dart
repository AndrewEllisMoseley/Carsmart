import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile/components/custom_text.dart';
import 'package:mobile/components/header.dart';
import 'package:mobile/styles/constants.dart';

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
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Material(
              elevation: 10.0,
              color: kWhiteText,
              child: Container(
                  margin: EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                  height: 450,
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Header(
                        text: 'Overview',
                      ),
                      CustomText(
                        text: 'Good news. You\'re vehicle has been assigned',
                        textColour: kBlackText,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(0.0, 20.0, 20.0, 20.0),
                        child: Divider(
                          color: kGreyText,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          CustomText(
                            text: 'Your Car',
                            textColour: kPrimaryColour,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            width: 260.0,
                          ),
                          CustomText(
                            text: 'Details',
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
                              text: 'Mercedes C200 2.0 AMG',
                              textColour: kBlackText,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              alignment: Alignment.center,
                            ),
                            CustomText(
                              text: 'Model: C200',
                              alignment: Alignment.center,
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
            ),
            Container(
              // margin: EdgeInsets.fromLTRB(30.0, 100.0, 30.0, 60.0),
              child: Image.asset('lib/assets/map.jpg'),
            ),
          ],
        ),
      ),
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
