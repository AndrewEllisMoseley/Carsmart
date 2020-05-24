import 'package:app/styles/styles.dart';
import 'package:app/wigets/custom_button.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'TestMaterialAppWidget.dart';

void main() {
  Widget _wrapWithMaterialApp(CustomButton customButton) {
    return TestMaterialAppWidget(
      home: customButton,
    );
  }

  testWidgets("Atom - customButton shown", (WidgetTester tester) async {
    //  given
    final widget = CustomButton(
      text: 'Login',
      onPressCallback: () {},
    );

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(find.byType(CustomButton), findsOneWidget);
  });

  testWidgets("Atom - customButton shown with 'Login'",
      (WidgetTester tester) async {
    //  given
    final widget = CustomButton(
      text: 'Login',
      onPressCallback: () {},
    );

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(find.text('Login'), findsOneWidget);
  });

  testWidgets("Atom - customButton check default styles are applied",
      (WidgetTester tester) async {
    //  given
    final widget = CustomButton(
      text: 'Login',
      onPressCallback: () {},
    );

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(
      tester.widget(find.byType(CustomButton)),
      isA<CustomButton>()
          .having((t) => t.backgroundColor, 'color', kSecondaryColour),
    );
    expect(
      tester.widget(find.byType(CustomButton)),
      isA<CustomButton>().having((t) => t.textColour, 'color', kWhiteText),
    );
  });

  testWidgets("Atom - customButton check custom styles are applied",
      (WidgetTester tester) async {
    //  given
    final widget = CustomButton(
      text: 'Test header',
      onPressCallback: () {},
      textColour: kPrimaryColour,
      backgroundColor: kWhiteText,
    );

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(
      tester.widget(find.byType(CustomButton)),
      isA<CustomButton>().having((t) => t.backgroundColor, 'color', kWhiteText),
    );
    expect(
      tester.widget(find.byType(CustomButton)),
      isA<CustomButton>().having((t) => t.textColour, 'color', kPrimaryColour),
    );
  });
}
