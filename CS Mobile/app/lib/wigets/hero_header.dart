import 'package:app/styles/styles.dart';
import 'package:flutter/material.dart';
import 'custom_text.dart';

class HeroHeader extends StatelessWidget {
  HeroHeader({@required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomText(
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
