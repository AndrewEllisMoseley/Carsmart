import 'package:flutter/material.dart';

import 'package:mobile/widgets/atoms/cButton.dart';
import 'package:mobile/widgets/atoms/cInputField.dart';
import 'package:mobile/widgets/atoms/cLink.dart';
import 'package:mobile/widgets/molecules/cCard.dart';

class RegisterOnePage extends StatelessWidget {
  const RegisterOnePage({Key key}) : super(key: key);

  static const headerText = ['Register'];
  static const subText = ['Enter to following details to get access.'];

  static const Key nextKey = Key('next');

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
                      fieldLabel: 'First Name:',
                      fieldPlaceholder: 'John',
                      icon: Icon(Icons.email),
                      fieldController: null,
                      validator: () {},
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    CInputField(
                      fieldLabel: 'Last Name:',
                      fieldPlaceholder: 'Doe',
                      icon: Icon(Icons.pan_tool),
                      fieldController: null,
                      validator: () {},
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    CButton(
                      text: 'NEXT',
                      redirect: '/register-two',
                      key: nextKey,
                    ),
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
