import 'package:app/styles/styles.dart';
import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  CustomHeader({@required this.text, this.textColour = kPrimaryColour});

  final String text;
  final Color textColour;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColour,
        fontFamily: 'Raleway',
        fontSize: 40.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
