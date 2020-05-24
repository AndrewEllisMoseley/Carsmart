import 'package:app/styles/styles.dart';
import 'package:flutter/material.dart';

class CustomLink extends StatelessWidget {
  CustomLink(
      {@required this.textOne, this.textTwo = '', @required this.redirect});

  final String textOne;
  final String textTwo;
  final Function redirect;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Row(
        children: <Widget>[
          Text(
            textOne,
            style: TextStyle(
              color: kGreyText,
              fontFamily: 'Raleway',
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          InkWell(
            onTap: redirect,
            child: Text(
              textTwo,
              style: TextStyle(
                color: kSecondaryColour,
                fontFamily: 'Raleway',
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
