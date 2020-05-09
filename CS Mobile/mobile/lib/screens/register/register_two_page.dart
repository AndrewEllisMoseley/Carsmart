import 'package:flutter/material.dart';
import 'package:mobile/components/background_card.dart';
import 'package:mobile/components/button.dart';
import 'package:mobile/components/field_input.dart';
import 'package:mobile/components/register_link.dart';

class RegisterTwoPage extends StatelessWidget {
  const RegisterTwoPage({Key key}) : super(key: key);

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
                      fieldLabel: 'Company:',
                      fieldPlaceholder: 'Please Select',
                      icon: Icon(Icons.email),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    FieldInput(
                      fieldLabel: 'Job Title:',
                      fieldPlaceholder: 'Please Select',
                      icon: Icon(Icons.pan_tool),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Button(text: 'NEXT', redirect: '/register-three'),
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
