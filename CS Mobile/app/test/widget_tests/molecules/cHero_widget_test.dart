import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:mobile/widgets/molecules/cHero.dart';

import '../TestMaterialAppWidget.dart';

void main() {
  Widget _wrapWithMaterialApp(CHero cHero) {
    return TestMaterialAppWidget(
      home: cHero,
    );
  }

  testWidgets("Molecules - CHero shown", (WidgetTester tester) async {
    //  given
    final widget = CHero(
      text: 'Test text',
    );

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(find.byType(CHero), findsOneWidget);
  });

  testWidgets("Molecules - CHero shown with 'Test text'",
      (WidgetTester tester) async {
    //  given
    final widget = CHero(
      text: 'Test text',
    );

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(find.text('Test text'), findsOneWidget);
  });
}
