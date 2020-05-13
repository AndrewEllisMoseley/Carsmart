import 'package:flutter/material.dart';
import 'package:mobile/styles/styles.dart';
import 'package:mobile/widgets/atoms/cText.dart';

class CRegistrationBox extends StatelessWidget {
  final String registration;

  CRegistrationBox({@required this.registration});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 30.0, 0, 10.0),
      child: Center(
        child: Container(
          width: 160.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            children: <Widget>[
              Container(
                width: 40.0,
                height: 50.0,
                color: kTertiaryColour,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ColorFiltered(
                      child: Image.asset(
                        'lib/assets/flag.jpg',
                        height: 30.0,
                        width: 30.0,
                      ),
                      colorFilter: ColorFilter.mode(
                        kLightGreyText,
                        BlendMode.saturation,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 120.0,
                height: 50.0,
                color: kWhiteText,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CText(
                    text: 'CF69 SDK',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    textColour: kBlackText,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
