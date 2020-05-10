import 'package:flutter/material.dart';
import 'package:mobile/styles/constants.dart';
import 'package:mobile/widgets/atoms/cText.dart';

class CVehicleDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              FlatButton(
                child: CText(
                  text: 'Your Car',
                  textColour: kPrimaryColour,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
                onPressed: () {
                  print('pressed');
                },
              ),
              SizedBox(
                width: 200.0,
              ),
              FlatButton(
                child: CText(
                  text: 'Details',
                ),
                onPressed: () {},
              ),
            ],
          ),
          Center(
            child: Column(
              children: <Widget>[
                Container(
                  width: 200.0,
                  height: 200.0,
                  child: Image.asset('lib/assets/merc.png'),
                ),
                CText(
                  text: 'Mercedes C200 2.0 AMG',
                  textColour: kBlackText,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  alignment: Alignment.center,
                ),
                CText(
                  text: 'Model: C200',
                  alignment: Alignment.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
