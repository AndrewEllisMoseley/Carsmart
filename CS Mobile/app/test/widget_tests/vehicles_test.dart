import 'package:app/models/models.dart';
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
    Vehicle vehicle = new Vehicle(
      id: '1',
      licenseplate: 'abc',
      salesdesignation: 'mercedes 200',
      finorvin: '1123',
      nickname: 'nick',
      modelyear: '2017',
      colorname: 'blue',
      fueltype: 'petrol',
      powerhp: '233',
      powerkw: '233',
      numberofdoors: '5',
      numberofseats: '3',
    );
    //  given
    final widget = Vehicles(
      modelYear: '2017',
      vehicle: vehicle,
    );

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(find.byType(Vehicles), findsOneWidget);
  });

  testWidgets("Molecules - Vehicles shown with model year '2017'",
      (WidgetTester tester) async {
    Vehicle vehicle = new Vehicle(
      id: '1',
      licenseplate: 'abc',
      salesdesignation: 'mercedes 200',
      finorvin: '1123',
      nickname: 'nick',
      modelyear: '2017',
      colorname: 'blue',
      fueltype: 'petrol',
      powerhp: '233',
      powerkw: '233',
      numberofdoors: '5',
      numberofseats: '3',
    );
    //  given
    final widget = Vehicles(
      modelYear: vehicle.modelyear,
      vehicle: vehicle,
    );

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(find.text('Model Year: 2017'), findsOneWidget);
  });
}
