import 'package:flutter/material.dart';
import 'package:mobile/screens/landing/drawerOptionMobile.dart';
import 'package:mobile/screens/landing/drawerOptionTablet.dart';
import 'package:mobile/screens/landing/drawer_item_data.dart';
import 'package:mobile/widgets/framework/orientation_layout.dart';
import 'package:mobile/widgets/framework/screen_type_layout.dart';
import 'package:provider/provider.dart';

class DrawerOption extends StatelessWidget {
  const DrawerOption({Key key, this.title, this.iconData}) : super(key: key);

  final String title;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      child: ScreenTypeLayout(
        mobile: OrientationLayout(
          landscape: (context) => DrawerOptionMobileLandscape(),
          portrait: (context) => DrawerOptionMobilePortrait(),
        ),
        tablet: OrientationLayout(
          landscape: (context) => DrawerOptionMobileLandscape(),
          portrait: (context) => DrawerOptionTabletPortrait(),
        ),
      ),
      value: DrawerItemData(title: title, iconData: iconData),
    );
  }
}
