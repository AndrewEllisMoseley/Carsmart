import 'package:flutter/material.dart';
import 'package:mobile/styles/styles.dart';

class CSubHeader extends StatelessWidget {
  final String text;
  final Color textColour;

  CSubHeader({@required this.text, this.textColour = kPrimaryColour});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColour,
        fontFamily: 'Raleway',
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
