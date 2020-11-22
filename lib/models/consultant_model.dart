//Informacion que necesito enviar
import 'package:consult_it_app/models/user_model.dart';
import 'package:date_format/date_format.dart';

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

  factory Consultant.fromJson(Map<String, dynamic> json) {
    return Consultant(
        firstname: json['firstName'].toString() ?? '',
        lastName: json['lastName'].toString() ?? '',
        deegre: json['deegre'].toString() ?? '',
        photo: json['photo'].toString() ?? '',
        birthdate: json['birthdate'].toString() ?? '',
        referencePrice: double.parse(json['referencePrice'].toString()),
        historicAveragePrice:
            double.parse(json['historicAveragePrice'].toString()),
        phoneNumber: json['phoneNumber'].toString() ?? '',
        averageRating: double.parse(json['averageRating'].toString()),
        consultantType: json['consultantType'].toString() ?? '',
        state: json['state'].toString() ?? '',
        city: json['city'].toString() ?? '');
  }
}

class AllConsultants {
  static List<Consultant> _allConsultants = [];

  AllConsultants.fromJson(Map<String, dynamic> parsedJson) {
    allConsultants.clear();
    if (parsedJson != null && parsedJson.toString() != 'null') {
      List<dynamic> parsedConsultants = parsedJson['consultants'];
      for (var i = 0; i < parsedConsultants.length; i++) {
        Consultant consultant = Consultant.fromJson(parsedConsultants[i]);
        consultant.birthdate = convertDateFromString(consultant.birthdate);
        _allConsultants.add(consultant);
        print('Consultor $i: ${consultant.firstname}');
      }
    }
  }

  String convertDateFromString(String strDate) {
    DateTime todayDate = DateTime.parse(strDate);
    return (formatDate(todayDate, [dd, '/', mm, '/', yyyy]));
  }

  static List<Consultant> get allConsultants => _allConsultants;
}
