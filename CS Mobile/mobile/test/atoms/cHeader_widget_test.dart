import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:mobile/styles/constants.dart';
import 'package:mobile/widgets/atoms/cHeader.dart';

import '../TestMaterialAppWidget.dart';

void main() {
  Widget _wrapWithMaterialApp(CHeader cHeader) {
    return TestMaterialAppWidget(
      home: cHeader,
    );
  }

  testWidgets("Atom - CHeader shown", (WidgetTester tester) async {
    //  given
    final widget = CHeader(
      text: 'Test header',
    );

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(find.byType(CHeader), findsOneWidget);
  });

  testWidgets("Atom - CHeader shown with 'Test header'",
      (WidgetTester tester) async {
    //  given
    final widget = CHeader(
      text: 'Test header',
    );

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(find.text('Test header'), findsOneWidget);
  });

  testWidgets("Atom - CHeader check default styles are applied",
      (WidgetTester tester) async {
    //  given
    final widget = CHeader(
      text: 'Test header',
    );

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(
      tester.widget(find.byType(CHeader)),
      isA<CHeader>().having((t) => t.textColour, 'color', kPrimaryColour),
    );
  });

  testWidgets("Atom - CHeader check custom styles are applied",
      (WidgetTester tester) async {
    //  given
    final widget = CHeader(
      text: 'Test header',
      textColour: kSecondaryColour,
    );

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(
      tester.widget(find.byType(CHeader)),
      isA<CHeader>().having((t) => t.textColour, 'color', kSecondaryColour),
    );
  });
}
