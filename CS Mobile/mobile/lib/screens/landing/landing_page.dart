import 'package:flutter/material.dart';

import 'package:mobile/widgets/atoms/cButton.dart';
import 'package:mobile/widgets/molecules/cCard.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key key}) : super(key: key);

  static const headerText = ['LET\'S GET', 'STARTED'];
  static const subHeader = [
    'Registration takes less than a minute - you just need the company you work for and your job title.',
    'If you have an existing Carsmart account, then just log in with your usual details.'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              CCard(
                height: 450.0,
                headerText: headerText,
                subText: subHeader,
              ),
              SizedBox(
                height: 40.0,
              ),
              CButton(text: 'LOGIN', redirect: '/login'),
              SizedBox(
                height: 30.0,
              ),
              CButton(text: 'REGISTER', redirect: '/register-one'),
            ],
          ),
        ),
      ),
    );
  }
}
