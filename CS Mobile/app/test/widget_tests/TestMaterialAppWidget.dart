import 'package:flutter/material.dart';

class TestMaterialAppWidget extends StatelessWidget {
  final Widget home;

  TestMaterialAppWidget({
    Key key,
    this.home,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Test',
      home: home,
    );
  }
}
