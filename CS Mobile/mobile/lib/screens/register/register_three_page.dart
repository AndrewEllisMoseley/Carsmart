import 'package:flutter/material.dart';

import 'package:mobile/widgets/atoms/cButton.dart';
import 'package:mobile/widgets/atoms/cInputField.dart';
import 'package:mobile/widgets/atoms/cLink.dart';
import 'package:mobile/widgets/molecules/cCard.dart';

class RegisterThreePage extends StatelessWidget {
  const RegisterThreePage({Key key}) : super(key: key);

  static const headerText = ['Register'];
  static const subText = ['Enter to following details to get access.'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              CCard(
                height: 310.0,
                headerText: headerText,
                subText: subText,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 10.0),
                child: Column(
                  children: <Widget>[
                    CInputField(
                      fieldLabel: 'Email:',
                      fieldPlaceholder: 'Example@email.com',
                      icon: Icon(Icons.email),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    CInputField(
                      fieldLabel: 'Password:',
                      fieldPlaceholder: 'Password',
                      icon: Icon(Icons.security),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    CButton(text: 'REGISTER', redirect: '/vehicle-details'),
                    CLink(
                      text: 'Already have an account? Why not Login?',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
