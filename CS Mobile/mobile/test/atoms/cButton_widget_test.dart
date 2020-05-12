import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:mobile/widgets/atoms/cButton.dart';

import 'package:mobile/styles/constants.dart';

import '../TestMaterialAppWidget.dart';

void main() {
  Widget _wrapWithMaterialApp(CButton cButton) {
    return TestMaterialAppWidget(
      home: cButton,
    );
  }

  testWidgets("Atom - CButton shown", (WidgetTester tester) async {
    //  given
    final widget = CButton(
      text: 'Login',
      redirect: null,
    );

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(find.byType(CButton), findsOneWidget);
  });

  testWidgets("Atom - CButton shown with 'Login'", (WidgetTester tester) async {
    //  given
    final widget = CButton(
      text: 'Login',
      redirect: null,
    );

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(find.text('Login'), findsOneWidget);
  });

  testWidgets("Atom - CButton check default styles are applied",
      (WidgetTester tester) async {
    //  given
    final widget = CButton(
      text: 'Test header',
      redirect: null,
    );

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(
      tester.widget(find.byType(CButton)),
      isA<CButton>()
          .having((t) => t.backgroundColor, 'color', kSecondaryColour),
    );
    expect(
      tester.widget(find.byType(CButton)),
      isA<CButton>().having((t) => t.textColour, 'color', kWhiteText),
    );
  });

  testWidgets("Atom - CButton check custom styles are applied",
      (WidgetTester tester) async {
    //  given
    final widget = CButton(
      text: 'Test header',
      redirect: null,
      textColour: kPrimaryColour,
      backgroundColor: kWhiteText,
    );

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(
      tester.widget(find.byType(CButton)),
      isA<CButton>().having((t) => t.backgroundColor, 'color', kWhiteText),
    );
    expect(
      tester.widget(find.byType(CButton)),
      isA<CButton>().having((t) => t.textColour, 'color', kPrimaryColour),
    );
  });
}
