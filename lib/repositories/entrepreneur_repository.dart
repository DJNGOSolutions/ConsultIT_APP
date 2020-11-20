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
      String url = NetworkUtils.path + 'entrepreneur/findonebyusername';

      final response = await http.post(url, body: {
        "username": username,
      });
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
}
