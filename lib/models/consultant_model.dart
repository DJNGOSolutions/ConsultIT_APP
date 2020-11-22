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
      {this.firstname,
      this.lastName,
      this.deegre,
      this.photo,
      this.birthdate,
      this.referencePrice,
      this.historicAveragePrice,
      this.phoneNumber,
      this.averageRating,
      this.consultantType,
      this.state,
      this.city,
      this.user});

  factory Consultant.fromJsonObject(consultant) {
    return Consultant(
        firstname: consultant['firstname'].toString(),
        lastName: consultant['lastName'].toString(),
        deegre: consultant['deegre'].toString(),
        photo: consultant['photo'].toString(),
        birthdate: consultant['birthdate'].toString(),
        referencePrice: consultant['referencePrice'],
        historicAveragePrice: consultant['historicAveragePrice'],
        phoneNumber: consultant['phoneNumber'].toString(),
        averageRating: consultant['averageRating'],
        consultantType: consultant['consultantType'].toString(),
        state: consultant['state'].toString(),
        city: consultant['city'].toString());
  }

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

class AllConsultants {
  static List<Consultant> _allConsultants;

  AllConsultants.fromJson(Map<String, dynamic> parsedJson) {
    if (parsedJson != null &&
        parsedJson.toString() != 'null' &&
        parsedJson.isNotEmpty) {
      dynamic parsedConsultants = parsedJson['consultants'];
      for (var i = 0; i < parsedConsultants.length; i++) {
        Consultant consultant = Consultant.fromJsonObject(parsedConsultants[i]);
        _allConsultants.add(consultant);
      }
    }
  }

  static List<Consultant> get allConsultants => _allConsultants;
}
