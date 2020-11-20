import 'dart:convert';

import 'package:consult_it_app/models/business_model.dart';
import 'package:consult_it_app/utils/network_utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BusinessRepository {
  String TAG = 'BusinessRepository';

  Future<ServerResponse> addNewBusiness({
    @required String username,
    @required String legalName,
    @required String comercialName,
    @required String email,
    @required String phoneNumber,
    @required String address,
    @required String postalAddress,
    @required String state,
    @required String city,
    @required String businessLine,
    @required String businessSector,
  }) async {
    ServerResponse serverResponse = new ServerResponse();
    try {
      String url = NetworkUtils.path + 'entrepreneur/createbusiness';
      final response = await http.post(url, body: {
        "username": username,
        "legalName": email,
        "comercialName": comercialName,
        "email": email,
        "phoneNumber": phoneNumber,
        "address": address,
        "postalAddress": postalAddress,
        "state": state,
        "city": city,
        "businessLine": businessLine,
        "businessSector": businessSector,
      });
      if (response.statusCode == 200) {
        serverResponse = ServerResponse.fromJson(json.decode(response.body));
        serverResponse.statusCode = 200;
      } else if (response.statusCode == 400) {
        serverResponse = ServerResponse.fromJson(json.decode(response.body));
        serverResponse.statusCode = 400;
      } else if (response.statusCode == 403) {
        serverResponse = ServerResponse.fromJson(json.decode(response.body));
        serverResponse.statusCode = 403;
      } else if (response.statusCode == 500) {
        serverResponse = ServerResponse.fromJson(json.decode(response.body));
        serverResponse.statusCode = 500;
      } else {
        serverResponse.message = 'Error de conexion';
        serverResponse.statusCode = 400;
      }
    } catch (e) {
      print('ERROR: $TAG: addNewBusiness: ' + e.toString());
      serverResponse.statusCode = 1;
      serverResponse.message = 'Error de conexion con la aplicacion';
    }
    return serverResponse;
  }

  Future<List<Business>> findAllBusinesses({@required username}) async {
    try {
      String url = NetworkUtils.path + 'entrepreneur/findallbusinesses';

      final response = await http.post(url, body: {
        "username": username,
      });

      if (response.statusCode == 200) {
        //TODO: Parse list of businesses
      } else {
        return null;
      }
    } catch (e) {
      print('ERROR: $TAG: findConsultantByUsername: ' + e.toString());
      return null;
    }
  }
}
