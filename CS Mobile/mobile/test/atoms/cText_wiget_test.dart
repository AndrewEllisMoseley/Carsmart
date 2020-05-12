import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:mobile/widgets/atoms/cText.dart';

import 'package:mobile/styles/constants.dart';

import '../TestMaterialAppWidget.dart';

void main() {
  Widget _wrapWithMaterialApp(CText cText) {
    return TestMaterialAppWidget(
      home: cText,
    );
  }

  testWidgets("Atom - CText shown", (WidgetTester tester) async {
    //  given
    final widget = CText(
      text: 'Test text',
    );

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(find.byType(CText), findsOneWidget);
  });

  testWidgets("Atom - CText shown with 'Test text'",
      (WidgetTester tester) async {
    //  given
    final widget = CText(
      text: 'Test text',
    );

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(find.text('Test text'), findsOneWidget);
  });

  testWidgets("Atom - CText check default styles are applied",
      (WidgetTester tester) async {
    //  given
    final widget = CText(
      text: 'Test header',
    );

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(
      tester.widget(find.byType(CText)),
      isA<CText>().having((t) => t.textColour, 'color', kGreyText),
    );
    expect(
      tester.widget(find.byType(CText)),
      isA<CText>().having((t) => t.fontWeight, 'fontWeight', FontWeight.normal),
    );
    expect(
      tester.widget(find.byType(CText)),
      isA<CText>().having((t) => t.fontSize, 'fontSize', 14.0),
    );
    expect(
      tester.widget(find.byType(CText)),
      isA<CText>()
          .having((t) => t.alignment, 'alignment', Alignment.bottomLeft),
    );
    expect(
      tester.widget(find.byType(CText)),
      isA<CText>().having((t) => t.padding, 'padding', 0.0),
    );
    expect(
      tester.widget(find.byType(CText)),
      isA<CText>().having((t) => t.left, 'left', 0.0),
    );
    expect(
      tester.widget(find.byType(CText)),
      isA<CText>().having((t) => t.right, 'right', 0.0),
    );
    expect(
      tester.widget(find.byType(CText)),
      isA<CText>().having((t) => t.top, 'top', 0.0),
    );
    expect(
      tester.widget(find.byType(CText)),
      isA<CText>().having((t) => t.bottom, 'bottom', 0.0),
    );
  });

  testWidgets("Atom - CText check custom styles are applied",
      (WidgetTester tester) async {
    //  given
    final widget = CText(
      text: 'Test header',
      textColour: kSecondaryColour,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      alignment: Alignment.topLeft,
      padding: 20.0,
      left: 5.0,
      right: 10.0,
      top: 15.0,
      bottom: 20.0,
    );

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(
      tester.widget(find.byType(CText)),
      isA<CText>().having((t) => t.textColour, 'color', kSecondaryColour),
    );
    expect(
      tester.widget(find.byType(CText)),
      isA<CText>().having((t) => t.fontWeight, 'fontWeight', FontWeight.bold),
    );
    expect(
      tester.widget(find.byType(CText)),
      isA<CText>().having((t) => t.fontSize, 'fontSize', 20.0),
    );
    expect(
      tester.widget(find.byType(CText)),
      isA<CText>().having((t) => t.alignment, 'alignment', Alignment.topLeft),
    );
    expect(
      tester.widget(find.byType(CText)),
      isA<CText>().having((t) => t.padding, 'padding', 20.0),
    );
    expect(
      tester.widget(find.byType(CText)),
      isA<CText>().having((t) => t.left, 'left', 5.0),
    );
    expect(
      tester.widget(find.byType(CText)),
      isA<CText>().having((t) => t.right, 'right', 10.0),
    );
    expect(
      tester.widget(find.byType(CText)),
      isA<CText>().having((t) => t.top, 'top', 15.0),
    );
    expect(
      tester.widget(find.byType(CText)),
      isA<CText>().having((t) => t.bottom, 'bottom', 20.0),
    );
  });
}
