import 'package:flutter/cupertino.dart';
import 'package:mobile/enums/device_screen_type.dart';
import 'package:test/test.dart';
import 'package:mobile/utilities/sizing_information.dart';

void main() {
  group('Sizing Information Class', () {
    test("Should return Sizing Information in a string", () {
      final Orientation orientation = Orientation.portrait;
      final DeviceScreenType deviceScreenType = DeviceScreenType.desktop;
      final Size screenSize = Size(1000, 500);
      final Size localWidgetSize = Size(500, 500);

      var sizingInformation = SizingInformation(
          orientation: orientation,
          deviceScreenType: deviceScreenType,
          screenSize: screenSize,
          localWidgetSize: localWidgetSize);
      final String sizingInformationString = sizingInformation.toString();
      final String expectedString =
          'Orientation:$orientation DeviceScreenType:$deviceScreenType ScreenSize:$screenSize LocalWidgetSize:$localWidgetSize';
      expect(sizingInformationString, expectedString);
    });
  });
}
