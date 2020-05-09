import 'package:flutter/material.dart';
import 'package:mobile/styles/constants.dart';

class CustomText extends StatelessWidget {
  CustomText({
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

  final text;
  final textColour;
  final fontSize;
  final fontWeight;
  final padding;
  final alignment;
  final left;
  final top;
  final bottom;
  final right;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: new EdgeInsets.fromLTRB(left, top, right, bottom),
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
