import 'package:flutter/material.dart';
import 'package:mobile/screens/landing/HomeViewMobile.dart';
import 'package:mobile/screens/landing/HomeViewTablet.dart';
import 'package:mobile/widgets/framework/orientation_layout.dart';
import 'package:mobile/widgets/framework/screen_type_layout.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: (context) => HomeMobilePortait(),
        landscape: (context) => HomeMobileLandscape(),
      ),
      tablet: OrientationLayout(
        portrait: (context) => HomeTabletPortait(),
        landscape: (context) => HomeTabletPortait(),
      ),
    );
  }
}
