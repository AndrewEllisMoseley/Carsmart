import 'package:flutter/material.dart';
import 'package:mobile/styles/styles.dart';

class CHeader extends StatelessWidget {
  CHeader({@required this.text, this.textColour = kPrimaryColour});

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
