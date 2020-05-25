import 'package:app/widgets/vehicle.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'TestMaterialAppWidget.dart';

void main() {
  Widget _wrapWithMaterialApp(Vehicles vehicles) {
    return TestMaterialAppWidget(
      home: vehicles,
    );
  }

  testWidgets("Molecules - Vehicles shown", (WidgetTester tester) async {
    //  given
    final widget = Vehicles(
      description: 'Mercedes AMG',
      model: '2017',
    );

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(find.byType(Vehicles), findsOneWidget);
  });

  testWidgets("Molecules - Vehicles shown with 'CF69 SDK'",
      (WidgetTester tester) async {
    //  given
    final widget = Vehicles(
      description: 'Mercedes AMG',
      model: '2017',
    );

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(find.text('Meredes AMG'), findsOneWidget);
  });
}
