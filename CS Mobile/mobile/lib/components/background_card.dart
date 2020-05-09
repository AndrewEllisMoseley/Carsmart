import 'package:flutter/material.dart';
import 'package:mobile/components/custom_text.dart';

import 'header.dart';

class BackgroundCard extends StatelessWidget {
  BackgroundCard(
      {@required this.height,
      @required this.headerText,
      @required this.subText});

  final height;
  final headerText;
  final subText;

  @override
  Widget build(BuildContext context) {
    print(headerText[0]);
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
                  for (var header in headerText)
                    Container(
                      margin: EdgeInsets.fromLTRB(30.0, 0, 0, 0),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Header(
                          text: header,
                        ),
                      ),
                    ),
                  for (var text in subText)
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
