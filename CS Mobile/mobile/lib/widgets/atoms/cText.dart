import 'package:flutter/material.dart';
import 'package:mobile/styles/constants.dart';

class CText extends StatelessWidget {
  final String text;
  final Color textColour;
  final double fontSize;
  final FontWeight fontWeight;
  final double padding;
  final Alignment alignment;
  final double left;
  final double top;
  final double bottom;
  final double right;

  CText({
    @required this.text,
    this.textColour = kGreyText,
    this.fontSize = 14.0,
    this.fontWeight = FontWeight.normal,
    this.padding = 0.0,
    this.alignment = Alignment.bottomLeft,
    this.left = 0.0,
    this.top = 0.0,
    this.bottom = 0.0,
    this.right = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(left, top, right, bottom),
      child: Align(
        alignment: alignment,
        child: Text(
          text,
          style: TextStyle(
            color: textColour,
            fontFamily: 'Raleway',
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
