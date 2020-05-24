import 'package:app/wigets/custom_link.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'TestMaterialAppWidget.dart';

void main() {
  Widget _wrapWithMaterialApp(CustomLink customLink) {
    return TestMaterialAppWidget(
      home: customLink,
    );
  }

  testWidgets("Atom - customLink shown", (WidgetTester tester) async {
    //  given
    final widget = CustomLink(
      textOne: 'Test sub header',
      redirect: () {},
    );

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(find.byType(CustomLink), findsOneWidget);
  });

  testWidgets("Atom - customLink shown with 'Link wording'",
      (WidgetTester tester) async {
    //  given
    final widget = CustomLink(
      textOne: 'Test sub header',
      textTwo: 'Extra text',
      redirect: () {},
    );

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(find.text('Extra text'), findsOneWidget);
  });
}
