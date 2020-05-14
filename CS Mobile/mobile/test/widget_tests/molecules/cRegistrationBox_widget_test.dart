import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:mobile/widgets/molecules/cRegistrationBox.dart';

import '../TestMaterialAppWidget.dart';

void main() {
  Widget _wrapWithMaterialApp(CRegistrationBox cRegistrationBox) {
    return TestMaterialAppWidget(
      home: cRegistrationBox,
    );
  }

  testWidgets("Molecules - CRegistrationBox shown",
      (WidgetTester tester) async {
    //  given
    final widget = CRegistrationBox(
      registration: 'CF69 SDK',
    );

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(find.byType(CRegistrationBox), findsOneWidget);
  });

  testWidgets("Molecules - CRegistrationBox shown with 'CF69 SDK'",
      (WidgetTester tester) async {
    //  given
    final widget = CRegistrationBox(
      registration: 'CF69 SDK',
    );

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(find.text('CF69 SDK'), findsOneWidget);
  });
}
