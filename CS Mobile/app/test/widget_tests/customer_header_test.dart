import 'package:app/styles/styles.dart';
import 'package:app/wigets/custom_header.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'TestMaterialAppWidget.dart';

void main() {
  Widget _wrapWithMaterialApp(CustomHeader customHeader) {
    return TestMaterialAppWidget(
      home: customHeader,
    );
  }

  testWidgets("Atom - CustomHeader shown", (WidgetTester tester) async {
    //  given
    final widget = CustomHeader(
      text: 'Test header',
    );

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(find.byType(CustomHeader), findsOneWidget);
  });

  testWidgets("Atom - CustomHeader shown with 'Test header'",
      (WidgetTester tester) async {
    //  given
    final widget = CustomHeader(
      text: 'Test header',
    );

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(find.text('Test header'), findsOneWidget);
  });

  testWidgets("Atom - CustomHeader check default styles are applied",
      (WidgetTester tester) async {
    //  given
    final widget = CustomHeader(
      text: 'Test header',
    );

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(
      tester.widget(find.byType(CustomHeader)),
      isA<CustomHeader>().having((t) => t.textColour, 'color', kPrimaryColour),
    );
  });

  testWidgets("Atom - CustomHeader check custom styles are applied",
      (WidgetTester tester) async {
    //  given
    final widget = CustomHeader(
      text: 'Test header',
      textColour: kSecondaryColour,
    );

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(
      tester.widget(find.byType(CustomHeader)),
      isA<CustomHeader>()
          .having((t) => t.textColour, 'color', kSecondaryColour),
    );
  });
}
