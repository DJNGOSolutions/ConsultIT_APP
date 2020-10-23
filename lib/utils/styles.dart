import 'package:flutter/material.dart';

class Fonts {
  static get primaryFont => 'SourceSansPro';
  static get secondaryFont => 'Montserrat';
}

class MyColors {
  static get mainColor => Color.fromRGBO(13, 59, 108, 1);
  static get secondaryColor => Color.fromRGBO(95, 95, 196, 1);
  static get accentColor => Color.fromRGBO(224, 220, 38, 1);
  static get textFieldColor => Color.fromRGBO(3, 90, 166, 1);
}

class Styles {
  static get mainStyle => TextStyle(
        fontStyle: Fonts.primaryFont,
        fontSize: 16,
      );
}
