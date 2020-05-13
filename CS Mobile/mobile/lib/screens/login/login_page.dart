import 'package:flutter/material.dart';

import 'package:mobile/widgets/atoms/cButton.dart';
import 'package:mobile/widgets/atoms/cInputField.dart';
import 'package:mobile/widgets/atoms/cLink.dart';
import 'package:mobile/widgets/molecules/cCard.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  static const headerText = ['Login'];
  static const subText = ['Enter to following details to get access.'];

  static const Key loginKey = Key('login');

  static const Key login = Key('login');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              CCard(
                height: MediaQuery.of(context).size.height * 0.45,
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
                      fieldController: null,
                      validator: () {},
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    CInputField(
                      fieldLabel: 'Password:',
                      fieldPlaceholder: 'Password',
                      icon: Icon(Icons.security),
                      fieldController: null,
                      validator: () {},
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    CButton(
                      text: 'LOGIN',
                      redirect: '/vehicle-details',
                      key: loginKey,
                    ),
                    CLink(
                      text: 'Don\'t have an account? Register for one!',
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
