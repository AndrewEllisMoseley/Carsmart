import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:mobile/widgets/molecules/cCard.dart';

import '../TestMaterialAppWidget.dart';

void main() {
  Widget _wrapWithMaterialApp(CCard cCard) {
    return TestMaterialAppWidget(
      home: cCard,
    );
  }

  testWidgets("Molecules - CCard shown", (WidgetTester tester) async {
    //  given
    final widget = CCard(
      headerText: ['Login'],
      height: 450.0,
      subText: ['Enter details to login'],
    );

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(find.byType(CCard), findsOneWidget);
  });

  testWidgets(
      "Molecules - CCard shown with 'Login' as the header and 'Enter details to login' as the sub test",
      (WidgetTester tester) async {
    //  given
    final widget = CCard(
      headerText: ['Login'],
      height: 450.0,
      subText: ['Enter details to login'],
    );

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Enter details to login'), findsOneWidget);
  });

  testWidgets("Molecules - CCard shown with more than one heading and sub text",
      (WidgetTester tester) async {
    //  given
    final widget = CCard(
      headerText: ['LET\'S GET', 'STARTED'],
      height: 450.0,
      subText: ['Login', 'Register'],
    );

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(find.text('LET\'S GET'), findsOneWidget);
    expect(find.text('STARTED'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Register'), findsOneWidget);
  });
}
