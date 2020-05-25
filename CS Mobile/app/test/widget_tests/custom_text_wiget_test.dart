import 'package:app/styles/styles.dart';
import 'package:app/wigets/custom_text.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'TestMaterialAppWidget.dart';

void main() {
  Widget _wrapWithMaterialApp(CustomText customText) {
    return TestMaterialAppWidget(
      home: customText,
    );
  }

  testWidgets("Atom - CustomText shown", (WidgetTester tester) async {
    //  given
    final widget = CustomText(
      text: 'Test text',
    );

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(find.byType(CustomText), findsOneWidget);
  });

  testWidgets("Atom - CustomText shown with 'Test text'",
      (WidgetTester tester) async {
    //  given
    final widget = CustomText(
      text: 'Test text',
    );

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(find.text('Test text'), findsOneWidget);
  });

  testWidgets("Atom - CustomText check default styles are applied",
      (WidgetTester tester) async {
    //  given
    final widget = CustomText(
      text: 'Test header',
    );

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(
      tester.widget(find.byType(CustomText)),
      isA<CustomText>().having((t) => t.textColour, 'color', kGreyText),
    );
    expect(
      tester.widget(find.byType(CustomText)),
      isA<CustomText>()
          .having((t) => t.fontWeight, 'fontWeight', FontWeight.normal),
    );
    expect(
      tester.widget(find.byType(CustomText)),
      isA<CustomText>().having((t) => t.fontSize, 'fontSize', 14.0),
    );
    expect(
      tester.widget(find.byType(CustomText)),
      isA<CustomText>()
          .having((t) => t.alignment, 'alignment', Alignment.bottomLeft),
    );
    expect(
      tester.widget(find.byType(CustomText)),
      isA<CustomText>().having((t) => t.padding, 'padding', 0.0),
    );
    expect(
      tester.widget(find.byType(CustomText)),
      isA<CustomText>().having((t) => t.left, 'left', 0.0),
    );
    expect(
      tester.widget(find.byType(CustomText)),
      isA<CustomText>().having((t) => t.right, 'right', 0.0),
    );
    expect(
      tester.widget(find.byType(CustomText)),
      isA<CustomText>().having((t) => t.top, 'top', 0.0),
    );
    expect(
      tester.widget(find.byType(CustomText)),
      isA<CustomText>().having((t) => t.bottom, 'bottom', 0.0),
    );
  });

  testWidgets("Atom - CustomText check custom styles are applied",
      (WidgetTester tester) async {
    //  given
    final widget = CustomText(
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
      tester.widget(find.byType(CustomText)),
      isA<CustomText>().having((t) => t.textColour, 'color', kSecondaryColour),
    );
    expect(
      tester.widget(find.byType(CustomText)),
      isA<CustomText>()
          .having((t) => t.fontWeight, 'fontWeight', FontWeight.bold),
    );
    expect(
      tester.widget(find.byType(CustomText)),
      isA<CustomText>().having((t) => t.fontSize, 'fontSize', 20.0),
    );
    expect(
      tester.widget(find.byType(CustomText)),
      isA<CustomText>()
          .having((t) => t.alignment, 'alignment', Alignment.topLeft),
    );
    expect(
      tester.widget(find.byType(CustomText)),
      isA<CustomText>().having((t) => t.padding, 'padding', 20.0),
    );
    expect(
      tester.widget(find.byType(CustomText)),
      isA<CustomText>().having((t) => t.left, 'left', 5.0),
    );
    expect(
      tester.widget(find.byType(CustomText)),
      isA<CustomText>().having((t) => t.right, 'right', 10.0),
    );
    expect(
      tester.widget(find.byType(CustomText)),
      isA<CustomText>().having((t) => t.top, 'top', 15.0),
    );
    expect(
      tester.widget(find.byType(CustomText)),
      isA<CustomText>().having((t) => t.bottom, 'bottom', 20.0),
    );
  });
}
