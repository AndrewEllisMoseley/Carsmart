import 'package:flutter/material.dart';
import 'package:mobile/styles/styles.dart';

class CLink extends StatelessWidget {
  CLink({@required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          text,
          style: TextStyle(
            color: kGreyText,
            fontFamily: 'Raleway',
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
