import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile/screens/landing/land.dart';
import 'package:mobile/screens/vehicle/vehicle_details_page.dart';

// import 'screens/landing/landing_page.dart';
import 'screens/login/login_page.dart';
import 'screens/register/register_one_page.dart';
import 'screens/register/register_three_page.dart';
import 'screens/register/register_two_page.dart';

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.of(context).locale,
      builder: DevicePreview.appBuilder,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeView(),
        '/login': (context) => LoginPage(),
        '/register-one': (context) => RegisterOnePage(),
        '/register-two': (context) => RegisterTwoPage(),
        '/register-three': (context) => RegisterThreePage(),
        '/vehicle-details': (context) => VehicleDetailsPage(),
      },
    );
  }
}
