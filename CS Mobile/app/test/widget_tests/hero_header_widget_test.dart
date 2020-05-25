import 'package:app/widgets/hero_header.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'TestMaterialAppWidget.dart';

void main() {
  Widget _wrapWithMaterialApp(HeroHeader heroHeader) {
    return TestMaterialAppWidget(
      home: heroHeader,
    );
  }

  testWidgets("Atom - HeroHeader shown", (WidgetTester tester) async {
    //  given
    final widget = HeroHeader(
      text: 'Test hero header',
    );

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(find.byType(HeroHeader), findsOneWidget);
  });

  testWidgets("Atom - HeroHeader shown with 'Test hero header'",
      (WidgetTester tester) async {
    //  given
    final widget = HeroHeader(
      text: 'Test hero header',
    );

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(find.text('Test hero header'), findsOneWidget);
  });
}
