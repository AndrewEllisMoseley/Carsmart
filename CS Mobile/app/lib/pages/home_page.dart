import 'package:app/blocs/authentication/authentication.dart';
import 'package:app/pages/vehicle/vehicle_access_page.dart';
import 'package:app/services/mercedes_service.dart';
import 'package:app/styles/styles.dart';
import 'package:app/widgets/app_drawer.dart';
import 'package:app/widgets/custom_header.dart';
import 'package:app/widgets/custom_text.dart';
import 'package:app/widgets/vehicle_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/models.dart';

class HomePage extends StatefulWidget {
  final User user;

  const HomePage({Key key, this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static bool _isLoading = true;
  static Vehicle vehicle = new Vehicle();
  Vehicle vehicleData;
  dynamic vehicleMap;
  _getVehicleDetails() async {
    vehicleData = await mercedesService.getVehicle('4FD2C33C609D5B8F96');
    setState(() {
      vehicle = vehicleData;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _getVehicleDetails();
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthenticationBloc>(context);

    List<Widget> _widgetOptions = <Widget>[
      Text('Request form'),
      VehicleDetails(
        vehicle: vehicle,
        user: widget.user,
      ),
      VehicleAccessPage(
        vehicle: vehicle,
      ),
    ];

    // ignore_for_file: unused_element
    void dispose() {
      authBloc.close();
    }

    return Scaffold(
      endDrawer: AppDrawer(user: widget.user),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kWhiteText,
        elevation: 0.0,
        title: CustomHeader(
          text: 'Carsmart',
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Builder(
              builder: (context) => IconButton(
                icon: Icon(
                  Icons.account_circle,
                  color: kSecondaryColour,
                  size: 45.0,
                ),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
            ),
          ),
        ],
      ),
      body: _isLoading != false
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
          : SafeArea(
              // minimum: const EdgeInsets.all(16),
              child: Center(
                child: _widgetOptions.elementAt(_selectedIndex),
              ),
            ),
      bottomNavigationBar: BottomNavigationBar(
        //TODO REMOVE THIS CHECK HERE
        items: widget.user.firstName == 'Super'
            ? <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.conciergeBell),
                  title: Text('Request'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.car),
                  title: Text('Your vehicle'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.carBattery,
                  ),
                  title: Text('Access'),
                ),
              ]
            : <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.conciergeBell),
                  title: Text('Request'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.car),
                  title: Text('Your vehicle'),
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
