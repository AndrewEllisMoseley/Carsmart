import 'package:app/blocs/authentication/authentication.dart';
import 'package:app/styles/styles.dart';
import 'package:app/widgets/custom_header.dart';
import 'package:app/widgets/vehicle_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  static List<Widget> _widgetOptions = <Widget>[
    Text('Request form'),
    VehicleDetails(),
    Text('Access Page'),
  ];

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthenticationBloc>(context);

    // ignore_for_file: unused_element
    void dispose() {
      authBloc.close();
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: CustomHeader(
          text: 'Overview',
        ),
        backgroundColor: kWhiteText,
        elevation: 0.0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              icon: Icon(
                Icons.account_circle,
                color: kPrimaryColour,
                size: 45.0,
              ),
              onPressed: () {
                authBloc.add(UserLoggedOut());
              },
            ),
          )
        ],
      ),
      body: SafeArea(
        // minimum: const EdgeInsets.all(16),
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
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
