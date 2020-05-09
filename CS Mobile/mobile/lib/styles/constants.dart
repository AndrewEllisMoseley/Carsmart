import 'package:flutter/material.dart';

const kPrimaryColour = Color(0xFF3EA0DD);
const kSecondaryColour = Color(0xFF14718E);
const kGreyText = Color(0xFF707070);
const kLightGreyText = Color(0xFFDCDCDC);
const kBlackText = Color(0xFF000000);
const kWhiteText = Color(0xFFFFFFFF);

kTextFieldInputDecoration(String labelText, String hintText, Icon icon) {
  return InputDecoration(
    labelText: labelText,
    labelStyle: TextStyle(
      fontWeight: FontWeight.bold,
    ),
    filled: true,
    fillColor: kWhiteText,
    hintText: hintText,
    suffixIcon: icon,
    hintStyle: TextStyle(
      color: kGreyText,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: kPrimaryColour, width: 0.5),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: kGreyText, width: 0.5),
      borderRadius: BorderRadius.all(
        Radius.circular(5.0),
      ),
    ),
  );
}
