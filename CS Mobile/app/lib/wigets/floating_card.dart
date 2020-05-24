import 'package:flutter/material.dart';

import 'custom_text.dart';
import 'hero_header.dart';

class FloatingCard extends StatelessWidget {
  FloatingCard(
      {@required this.height,
      @required this.headerText,
      @required this.subText});

  final double height;
  final List<String> headerText;
  final List<String> subText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Material(
          elevation: 10.0,
          child: Container(
            height: height,
            width: double.infinity,
            color: Colors.white,
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(30.0, 100.0, 30.0, 60.0),
                    child: Image.asset('lib/assets/logo-v1.png'),
                  ),
                  for (String header in headerText)
                    Container(
                      margin: EdgeInsets.fromLTRB(30.0, 0, 0, 0),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: HeroHeader(
                          text: header,
                        ),
                      ),
                    ),
                  for (String text in subText)
                    Container(
                      margin: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 20),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: CustomText(
                          text: text,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
