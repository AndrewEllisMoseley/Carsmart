import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

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
      fieldController: null,
      fieldLabel: 'Email',
      validator: null,
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
      fieldController: null,
      fieldLabel: 'Email',
      validator: null,
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
      fieldController: null,
      fieldLabel: 'Email',
      validator: null,
      icon: Icon(Icons.email),
    );

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(find.byIcon(Icons.email), findsOneWidget);
  });

  testWidgets("Atom - CInputField shown with a placeholder",
      (WidgetTester tester) async {
    //  given
    final widget = CInputField(
      fieldController: null,
      fieldLabel: 'Email',
      validator: null,
      icon: Icon(Icons.email),
      fieldPlaceholder: 'Placeholder',
    );

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(
      tester.widget(find.byType(CInputField)),
      isA<CInputField>()
          .having((t) => t.fieldPlaceholder, 'placeholder', 'Placeholder'),
    );
  });
}
