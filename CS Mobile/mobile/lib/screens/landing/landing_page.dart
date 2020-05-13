import 'package:flutter/material.dart';

import 'package:mobile/widgets/atoms/cButton.dart';
import 'package:mobile/widgets/molecules/cCard.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key key}) : super(key: key);

  static const List<String> headerText = ['LET\'S GET', 'STARTED'];
  static const List<String> subHeader = [
    'Registration takes less than a minute - you just need the company you work for and your job title.',
    'If you have an existing Carsmart account, then just log in with your usual details.'
  ];

  static const Key loginKey = Key('login');
  static const Key registerKey = Key('register');

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
              CButton(
                text: 'LOGIN',
                redirect: '/login',
                key: loginKey,
              ),
              SizedBox(
                height: 30.0,
              ),
              CButton(
                text: 'REGISTER',
                redirect: '/register-one',
                key: registerKey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
