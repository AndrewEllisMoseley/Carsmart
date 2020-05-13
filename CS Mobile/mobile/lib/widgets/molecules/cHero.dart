import 'package:flutter/material.dart';

import 'package:mobile/styles/styles.dart';
import 'package:mobile/widgets/atoms/cText.dart';

class CHero extends StatelessWidget {
  CHero({@required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CText(
          text: text,
          textColour: kBlackText,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 10),
          child: Divider(
            color: kGreyText,
          ),
        ),
      ],
    );
  }
}
