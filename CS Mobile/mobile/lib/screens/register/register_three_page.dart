import 'package:flutter/material.dart';
import 'package:mobile/components/background_card.dart';
import 'package:mobile/components/button.dart';
import 'package:mobile/components/field_input.dart';
import 'package:mobile/components/register_link.dart';

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
              BackgroundCard(
                height: 310.0,
                headerText: headerText,
                subText: subText,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 10.0),
                child: Column(
                  children: <Widget>[
                    FieldInput(
                      fieldLabel: 'Email:',
                      fieldPlaceholder: 'Example@email.com',
                      icon: Icon(Icons.email),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    FieldInput(
                      fieldLabel: 'Password:',
                      fieldPlaceholder: 'Password',
                      icon: Icon(Icons.security),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Button(text: 'REGISTER', redirect: '/vehicle-details'),
                    LoginRegisterLink(
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
