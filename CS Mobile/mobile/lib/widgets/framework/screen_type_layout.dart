import 'package:flutter/material.dart';
import 'package:mobile/enums/device_screen_type.dart';
import 'package:mobile/widgets/framework/responsive_builder.dart';

class ScreenTypeLayout extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ScreenTypeLayout({Key key, this.mobile, this.tablet, this.desktop})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      switch (sizingInformation.deviceScreenType) {
        case DeviceScreenType.tablet:
          return tablet;
        case DeviceScreenType.desktop:
          return desktop;
        default:
          return mobile;
      }
    });
  }
}
