import 'package:flutter/material.dart';

// Main app colours
const kPrimaryColour = Color(0xFF3EA0DD);
const kSecondaryColour = Color(0xFF14718E);
const kTertiaryColour = Color(0xFF034555);

// Text Colours
const kGreyText = Color(0xFF707070);
const kLightGreyText = Color(0xFFDCDCDC);
const kBlackText = Color(0xFF000000);
const kWhiteText = Color(0xFFFFFFFF);

// Appbar colours
const kWhiteBacground = Color(0xFFFFFFFF);

const kSplashScreenBackground = Color(0xFF21BAFF);
const kSplashScreenButton = Color(0xFF9BE7FF);

InputDecoration kTextFieldInputDecoration(
    String labelText, String hintText, Icon icon,
    {FontWeight fontWeight = FontWeight.bold}) {
  return InputDecoration(
    labelText: labelText,
    labelStyle: TextStyle(
      fontWeight: fontWeight,
      color: kSecondaryColour,
    ),
    filled: true,
    isDense: true,
    hintText: hintText,
    suffixIcon: icon,
    hintStyle: TextStyle(
      color: kGreyText,
    ),
    alignLabelWithHint: true,
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
