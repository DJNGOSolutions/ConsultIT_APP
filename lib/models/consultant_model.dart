//Informacion que necesito enviar
/*
* String firstname,
* String lastName,
* String deegre,
* String photo,
* DateTime birthdate,
* double referencePrice,
* double historicAveragePrice,
* String phoneNumber,
* double averageRating,
* String consultantType,
* String state,
* String city,
 */
import 'package:consult_it_app/models/user_model.dart';
import 'package:flutter/material.dart';

class Consultant {
  User user;
  String firstname;
  String lastName;
  String deegre;
  String photo;
  String birthdate;
  double referencePrice;
  double historicAveragePrice;
  String phoneNumber;
  double averageRating;
  String consultantType;
  String state;
  String city;

  Consultant(
      {@required this.firstname,
      @required this.lastName,
      @required this.deegre,
      @required this.photo,
      @required this.birthdate,
      @required this.referencePrice,
      @required this.historicAveragePrice,
      @required this.phoneNumber,
      @required this.averageRating,
      @required this.consultantType,
      @required this.state,
      @required this.city,
      @required this.user});
}
