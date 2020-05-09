import 'package:flutter/material.dart';
import 'package:mobile/components/background_card.dart';
import 'package:mobile/components/button.dart';

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
              BackgroundCard(
                height: 450.0,
                headerText: headerText,
                subText: subHeader,
              ),
              SizedBox(
                height: 40.0,
              ),
              Button(text: 'LOGIN', redirect: '/login'),
              SizedBox(
                height: 30.0,
              ),
              Button(text: 'REGISTER', redirect: '/register-one'),
            ],
          ),
        ),
      ),
    );
  }
}
