import 'dart:convert';
import 'package:consult_it_app/models/consultant_model.dart';
import 'package:consult_it_app/utils/network_utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const String TAG = 'ConsultantRepository';

class ConsultantRepository {
  Consultant consultant;

  Future<Consultant> findOneByUsername({@required username}) async {
    try {
      String url =
          NetworkUtils.path + 'consultant/findonebyusername?username=$username';

      final response = await http.get(url);

      if (response.statusCode == 200) {
        consultant = Consultant.fromJson(json.decode(response.body));
        return consultant;
      } else {
        print(response.toString());
        return null;
      }
    } catch (e) {
      print('ERROR: $TAG: findConsultantByUsername: ' + e.toString());
      return null;
    }
  }

  Future<List<Consultant>> findAllConsultants({page = 0, limit = 100}) async {
    try {
      String url =
          NetworkUtils.path + 'consultant/findAll?page=$page&limit=$limit';
      final response = await http.get(url);
      if (response != null) {
        AllConsultants.fromJson(json.decode(response.body));
        return AllConsultants.allConsultants;
      } else {
        return null;
      }
    } catch (e) {
      print('ERROR: $TAG: findAllConsultants: ' + e.toString());
      return null;
    }
  }

  Future<Consultant> updateProfile(
      {@required String id,
      @required String firstName,
      @required String lastName,
      @required String degree,
      @required String referencePrice,
      @required String phoneNumber,
      @required String consultantType,
      @required String state,
      @required String city}) async {
    try {
      String url = NetworkUtils.path + 'consultant/update';
      final response = await http.put(url, body: {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "degree": degree,
        "referencePrice": referencePrice,
        "phoneNumber": phoneNumber,
        "consultantType": consultantType,
        "state": state,
        "city": city
      });
      if (response != null) {
        Consultant serverResponse =
            Consultant.fromJson(json.decode(response.body));
        return serverResponse;
      } else {
        return null;
      }
    } catch (e) {
      print('ERROR: $TAG: updateProfile: ' + e.toString());
      return null;
    }
  }
}
