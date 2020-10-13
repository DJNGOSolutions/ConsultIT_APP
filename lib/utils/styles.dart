import 'package:flutter/material.dart';

class Fonts {
  static get primaryFont => 'SourceSansPro';
  static get secondaryFont => 'Montserrat';
}

class MyColors {
  static get mainColor => Color.fromRGBO(3, 90, 166, 1);
  static get secondaryColor => Color.fromRGBO(37, 117, 191, .6);
}

class Styles {
  static get mainStyle => TextStyle(
        fontStyle: Fonts.primaryFont,
        fontSize: 16,
      );
}
