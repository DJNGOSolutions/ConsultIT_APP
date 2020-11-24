import 'package:consult_it_app/models/business_model.dart';
import 'package:consult_it_app/models/user_model.dart';
import 'package:date_format/date_format.dart';

class Entrepreneur {
  User user;
  String firstName;
  String lastName;
  String photo;
  String birthDate;
  String phoneNumber;
  String postalAddress;
  String state;
  String city;
  List<Business> businesses;

  Entrepreneur(
      {this.birthDate,
      this.businesses,
      this.city,
      this.firstName,
      this.lastName,
      this.phoneNumber,
      this.photo,
      this.postalAddress,
      this.state,
      this.user});

  factory Entrepreneur.fromJson(Map<String, dynamic> json) {
    String convertDateFromString(String strDate) {
      DateTime todayDate = DateTime.parse(strDate);
      return (formatDate(todayDate, [dd, '/', mm, '/', yyyy]));
    }

    return Entrepreneur(
        birthDate: convertDateFromString(json['birthdate'].toString()),
        businesses: [],
        city: json['city'].toString(),
        firstName: json['firstName'].toString(),
        lastName: json['lastName'].toString(),
        phoneNumber: json['phoneNumber'].toString(),
        photo: json['photo'].toString(),
        postalAddress: json['postalAddress'].toString(),
        state: json['state'].toString());
  }
}
