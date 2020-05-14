import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:mobile/widgets/molecules/cVehicleDetails.dart';

import '../TestMaterialAppWidget.dart';

void main() {
  Widget _wrapWithMaterialApp(CVehicleDetails cVehicleDetails) {
    return TestMaterialAppWidget(
      home: cVehicleDetails,
    );
  }

  testWidgets("Molecules - CVehicleDetails shown", (WidgetTester tester) async {
    //  given
    final widget = CVehicleDetails();

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(find.byType(CVehicleDetails), findsWidgets);
  });
}
