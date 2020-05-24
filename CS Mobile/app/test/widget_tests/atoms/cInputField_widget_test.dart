import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:mobile/widgets/atoms/cInputField.dart';

import '../TestMaterialAppWidget.dart';

void main() {
  Widget _wrapWithMaterialApp(CInputField cInputField) {
    return TestMaterialAppWidget(
      home: cInputField,
    );
  }

  testWidgets("Atom - CInputField shown", (WidgetTester tester) async {
    //  given
    final widget = CInputField(
      inputFieldType: 'EMAIL',
    );

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(find.byType(CInputField), findsOneWidget);
  });

  testWidgets("Atom - CInputField shown with 'Eamil'",
      (WidgetTester tester) async {
    //  given
    final widget = CInputField(
      inputFieldType: 'EMAIL',
    );

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(find.text('Email'), findsOneWidget);
  });

  testWidgets("Atom - CInputField shown with an icon",
      (WidgetTester tester) async {
    //  given
    final widget = CInputField(
      inputFieldType: 'EMAIL',
    );

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(find.byIcon(FontAwesomeIcons.at), findsOneWidget);
  });
}
