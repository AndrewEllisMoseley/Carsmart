import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile/screens/account/account_page.dart';
import 'package:mobile/styles/constants.dart';
import 'package:mobile/services/locations.dart' as locations;

class VehicleLocationPage extends StatefulWidget {
  const VehicleLocationPage({Key key}) : super(key: key);

  @override
  _VehicleLocationPageState createState() => _VehicleLocationPageState();
}

class _VehicleLocationPageState extends State<VehicleLocationPage> {
  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await locations.getGoogleOffices();
    setState(() {
      _markers.clear();
      for (final office in googleOffices.offices) {
        final marker = Marker(
          markerId: MarkerId(office.name),
          position: LatLng(office.lat, office.lng),
          infoWindow: InfoWindow(
            title: office.name,
            snippet: office.address,
          ),
        );
        _markers[office.name] = marker;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: FlatButton(
          child: Text(
            'Back',
            style: TextStyle(color: kPrimaryColour),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
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
                  Navigator.push<dynamic>(
                    context,
                    MaterialPageRoute<dynamic>(
                      builder: (context) => ProfilePage(),
                    ),
                  );
                }),
          )
        ],
      ),
      body: SafeArea(
        child: Center(
          child: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: const LatLng(0, 0),
              zoom: 2,
            ),
            markers: _markers.values.toSet(),
          ),
        ),
      ),
    );
  }
}
