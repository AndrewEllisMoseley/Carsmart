import 'package:flutter/material.dart';
import 'package:mobile/widgets/atoms/cButton.dart';

import 'package:mobile/widgets/atoms/cInputField.dart';
import 'package:mobile/widgets/atoms/cText.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({Key key}) : super(key: key);

  static const headerText = ['Register'];
  static const subText = ['Enter to following details to get access.'];

  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  static const Key submitKey = Key('submit');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CText(
              text: 'Please complete the form below to request a vehicle.',
            ),
            CInputField(
              fieldLabel: 'Reason for vehicle:',
              fieldController: null,
              validator: () {},
            ),
            CInputField(
              fieldLabel: 'Start date:',
              fieldController: null,
              validator: () {},
            ),
            CInputField(
              fieldLabel: 'Number of dates required:',
              fieldController: null,
              validator: () {},
            ),
            CInputField(
              fieldLabel: 'Reason:',
              fieldController: null,
              validator: () {},
            ),
            CText(
              text: 'Requests can take up to 24 hours.',
            ),
            CButton(
              text: 'Submit',
              redirect: null,
              key: submitKey,
            ),
          ],
        ),
      ),
    );
  }
}
