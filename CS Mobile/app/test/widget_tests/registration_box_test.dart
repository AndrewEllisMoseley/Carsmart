import 'package:app/widgets/registration_box.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'TestMaterialAppWidget.dart';

void main() {
  Widget _wrapWithMaterialApp(RegistrationBox registrationBox) {
    return TestMaterialAppWidget(
      home: registrationBox,
    );
  }

  testWidgets("Molecules - RegistrationBox shown", (WidgetTester tester) async {
    //  given
    final widget = RegistrationBox(
      registration: 'CF69 SDK',
    );

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(find.byType(RegistrationBox), findsOneWidget);
  });

  testWidgets("Molecules - RegistrationBox shown with 'CF69 SDK'",
      (WidgetTester tester) async {
    //  given
    final widget = RegistrationBox(
      registration: 'CF69 SDK',
    );

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(find.text('CF69 SDK'), findsOneWidget);
  });
}
