import 'package:flutter/material.dart';
import 'package:mobile/styles/styles.dart';

class CButton extends StatelessWidget {
  CButton(
      {@required this.key,
      @required this.text,
      @required this.redirect,
      this.backgroundColor = kSecondaryColour,
      this.textColour = kWhiteText});

  @override
  final Key key;

  final String text;
  final String redirect;
  final Color backgroundColor;
  final Color textColour;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: 300.0,
      height: 50,
      child: FlatButton(
        key: key,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        onPressed: () {
          Navigator.pushNamed(context, redirect);
        },
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
