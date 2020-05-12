import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile/screens/account/account_page.dart';
import 'package:mobile/screens/request/request_page.dart';

import 'package:mobile/styles/constants.dart';
import 'package:mobile/widgets/atoms/cHeader.dart';
import 'package:mobile/widgets/templates/cVehicleDetailsTemplate.dart';

class VehicleDetailsPage extends StatefulWidget {
  const VehicleDetailsPage({Key key}) : super(key: key);

  static Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(45.521563, -122.677433);

  @override
  _VehicleDetailsPageState createState() => _VehicleDetailsPageState();
}

class _VehicleDetailsPageState extends State<VehicleDetailsPage> {
  void _onMapCreated(GoogleMapController controller) {
    VehicleDetailsPage._controller.complete(controller);
  }

  int _selectedIndex = 1;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    RequestPage(),
    CVehicleDetailsTemplate(),
    Text('Access Page'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(),
                  ),
                );
              },
            ),
          )
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.conciergeBell),
            title: Text('Request'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.car),
            title: Text('Your vehicle'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.carBattery),
            title: Text('Access'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: kPrimaryColour,
        selectedIconTheme: IconThemeData(size: 30.0),
        onTap: _onItemTapped,
      ),
    );
  }
}
