//Informacion que necesito enviar
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
      this.user});

  factory Consultant.fromJson(Map<String, dynamic> json) {
    return Consultant(
        firstname: json['firstName'].toString() ?? '',
        lastName: json['lastName'].toString() ?? '',
        deegre: json['deegre'].toString() ?? '',
        photo: json['photo'].toString() ?? '',
        birthdate: json['birthdate'].toString() ?? '',
        referencePrice: json['referencePrice'],
        historicAveragePrice: json['historicAveragePrice'],
        phoneNumber: json['phoneNumber'].toString() ?? '',
        averageRating: json['averageRating'],
        consultantType: json['consultantType'].toString() ?? '',
        state: json['state'].toString() ?? '',
        city: json['city'].toString() ?? '');
  }
}
