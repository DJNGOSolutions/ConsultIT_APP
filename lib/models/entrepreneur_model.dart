//Informacion del entrepreneur
import 'package:consult_it_app/models/business_model.dart';
import 'package:consult_it_app/models/user_model.dart';
/**
User user;
String firstName;
String lastName;
String photo;
DateTime birthDate; 
String phoneNumber;
String postalAddress;
String state;
String city;
List<Business> businesses;
 */

import 'package:flutter/material.dart';

class Entrepreneur {
  User user;
  String firstName;
  String lastName;
  String photo;
  DateTime birthDate;
  String phoneNumber;
  String postalAddress;
  String state;
  String city;
  List<Business> businesses;

  Entrepreneur(
      {@required this.birthDate,
      @required this.businesses,
      @required this.city,
      @required this.firstName,
      @required this.lastName,
      @required this.phoneNumber,
      @required this.photo,
      @required this.postalAddress,
      @required this.state,
      @required this.user});
}
