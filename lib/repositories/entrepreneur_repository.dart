import 'dart:convert';

import 'package:consult_it_app/models/entrepreneur_model.dart';
import 'package:consult_it_app/utils/network_utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const String TAG = "EntrepreneurRepository";

class EntrepreneurRepository {
  Entrepreneur entrepreneur;

  Future<Entrepreneur> findOneByUsername({@required username}) async {
    try {
      String url = NetworkUtils.path +
          'entrepreneur/findonebyusername?username=$username';
      final response = await http.get(url);
      if (response.statusCode == 200) {
        entrepreneur = Entrepreneur.fromJson(json.decode(response.body));
        return entrepreneur;
      } else {
        return null;
      }
    } catch (e) {
      print('ERROR: $TAG: findConsultantByUsername: ' + e.toString());
      return null;
    }
  }

  Future<Entrepreneur> updateProfile(
      {@required String id,
      String firstName,
      String lastName,
      String photo,
      String birthdate,
      String phoneNumber,
      String postalAddress,
      String state,
      String city}) async {
    try {
      String url = NetworkUtils.path + 'entrepreneur/update';
      final response = await http.put(url, body: {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
        "state": state,
        "city": city
      });
      if (response != null && response.statusCode == 200) {
        Entrepreneur serverResponse =
            Entrepreneur.fromJson(json.decode(response.body));
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
