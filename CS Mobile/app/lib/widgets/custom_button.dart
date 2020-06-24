import 'package:app/styles/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {@required this.text,
      this.backgroundColor = kSecondaryColour,
      this.textColour = kWhiteText,
      @required this.onPressCallback,
      this.width = 300.0,
      this.height = 50.0});

  final String text;
  final Color backgroundColor;
  final Color textColour;
  final Function onPressCallback;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: width,
      height: height,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        onPressed: onPressCallback,
        color: backgroundColor,
        child: Text(
          text,
          style: TextStyle(
            color: kWhiteText,
            fontFamily: 'Raleway',
            fontSize: 22.0,
          ),
        ),
      ),
    );
  }
}
