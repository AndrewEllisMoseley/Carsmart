import 'package:flutter/cupertino.dart';
import 'package:mobile/enums/device_screen_type.dart';
import 'package:test/test.dart';
import 'package:mobile/utilities/ui_utils.dart';

void main() {
  group('UI Utilities Class', () {
    test("Should return 'Desktop' Device Screen Size", () {
      var mediaQuery = MediaQueryData(size: Size.fromWidth(1000));
      final DeviceScreenType screenType = getDeviceType(mediaQuery);
      expect(screenType, DeviceScreenType.desktop);
    });

    test("Should return 'Tablet' Device Screen Size", () {
      var mediaQuery = MediaQueryData(size: Size.fromWidth(650));
      final DeviceScreenType screenType = getDeviceType(mediaQuery);
      expect(screenType, DeviceScreenType.tablet);
    });

    test("Should return 'Mobile' Device Screen Size", () {
      var mediaQuery = MediaQueryData();
      final DeviceScreenType screenType = getDeviceType(mediaQuery);
      expect(screenType, DeviceScreenType.mobile);
    });
  });
}
