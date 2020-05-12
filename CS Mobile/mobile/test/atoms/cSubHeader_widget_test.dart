import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:mobile/widgets/atoms/cSubHeader.dart';

import 'package:mobile/styles/constants.dart';

import '../TestMaterialAppWidget.dart';

void main() {
  Widget _wrapWithMaterialApp(CSubHeader cSubHeader) {
    return TestMaterialAppWidget(
      home: cSubHeader,
    );
  }

  testWidgets("Atom - CSubHeader shown", (WidgetTester tester) async {
    //  given
    final widget = CSubHeader(
      text: 'Test sub header',
    );

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(find.byType(CSubHeader), findsOneWidget);
  });

  testWidgets("Atom - CSubHeader shown with 'Test sub header'",
      (WidgetTester tester) async {
    //  given
    final widget = CSubHeader(
      text: 'Test sub header',
    );

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(find.text('Test sub header'), findsOneWidget);
  });

  testWidgets("Atom - CSubHeader check default styles are applied",
      (WidgetTester tester) async {
    //  given
    final widget = CSubHeader(
      text: 'Test header',
    );

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(
      tester.widget(find.byType(CSubHeader)),
      isA<CSubHeader>().having((t) => t.textColour, 'color', kPrimaryColour),
    );
  });

  testWidgets("Atom - CSubHeader check custom styles are applied",
      (WidgetTester tester) async {
    //  given
    final widget = CSubHeader(
      text: 'Test header',
      textColour: kSecondaryColour,
    );

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(
      tester.widget(find.byType(CSubHeader)),
      isA<CSubHeader>().having((t) => t.textColour, 'color', kSecondaryColour),
    );
  });
}
