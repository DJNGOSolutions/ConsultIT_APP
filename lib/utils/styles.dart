import 'package:flutter/material.dart';

class Fonts {
  static get primaryFont => 'SourceSansPro';
  static get secondaryFont => 'Montserrat';
}

class MyColors {
  static Color get mainColor => Color.fromRGBO(13, 59, 108, 1);
  static Color get secondaryColor => Color.fromRGBO(95, 95, 196, 1);
  static Color get accentColor => Color.fromRGBO(224, 220, 38, 1);
  static Color get textFieldColor => Color.fromRGBO(3, 90, 166, 1);
}

class Styles {
  static TextStyle get bodyTextStyle => TextStyle(
      fontFamily: Fonts.secondaryFont,
      fontSize: 16,
      fontWeight: FontWeight.bold);
  static TextStyle get headerTextStyle => TextStyle(
      fontFamily: Fonts.secondaryFont,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: MyColors.mainColor,
      wordSpacing: 1.9);
  static TextStyle get subHeaderTextStyle => TextStyle(
      fontFamily: Fonts.primaryFont, fontSize: 18, fontWeight: FontWeight.bold);
}
