import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:mobile/widgets/atoms/cLink.dart';

import '../TestMaterialAppWidget.dart';

void main() {
  Widget _wrapWithMaterialApp(CLink cLink) {
    return TestMaterialAppWidget(
      home: cLink,
    );
  }

  testWidgets("Atom - CLink shown", (WidgetTester tester) async {
    //  given
    final widget = CLink(
      text: 'Test sub header',
    );

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(find.byType(CLink), findsOneWidget);
  });

  testWidgets("Atom - CLink shown with 'Link wording'",
      (WidgetTester tester) async {
    //  given
    final widget = CLink(
      text: 'Link wording',
    );

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(find.text('Link wording'), findsOneWidget);
  });
}
