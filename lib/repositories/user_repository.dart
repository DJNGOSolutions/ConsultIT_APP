import 'dart:convert';

import 'package:consult_it_app/models/user_model.dart';
import 'package:consult_it_app/utils/network_utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

const String TAG = 'UserRepository';

class UserRepository {
  User user = new User();
  SharedPreferences _prefs;

  Future<User> authenticate(
      {@required String username, @required String password}) async {
    try {
      //Creando la url que se va a utilizar
      String url = NetworkUtils.path + 'user/signin';
      //realizando peticion al servidor
      final response = await http
          .post(url, body: {"identifier": username, "password": password});
      if (response.statusCode == 200) {
        //Mostrando mensaje de exito y asignamos la respuesta al usuario creado
        user = User.fromJson(json.decode(response.body));
        _prefs = await SharedPreferences.getInstance();
        await _prefs.setString('username', user.username);
        print('Username: ${user.username}');

        return user;
      } else {
        user.tipo = 'Error de Conexion';
      }
    } catch (e) {
      print('ERROR: $TAG: authenticate: ' + e.toString());
      user.tipo = 'Error de conexion';
      return user;
    }
    return user;
  }

  Future<ServerResponse> registerConsultant(
      {@required String username,
      @required String email,
      @required String password,
      @required String type,
      @required String firstName,
      @required String lastName,
      @required String birthdate,
      @required String referencePrice,
      @required String phoneNumber,
      @required String consultantType,
      @required String state,
      @required String city,
      @required String postalAddress,
      @required String photo,
      @required String historicAveragePrice}) async {
    ServerResponse serverResponse = new ServerResponse();
    try {
      String url = NetworkUtils.path + 'user/signup';
      final response = await http.post(url, body: {
        "username": username,
        "email": email,
        "password": password,
        "type": type,
        "firstName": firstName,
        "lastName": lastName,
        "birthdate": birthdate,
        "referencePrice": referencePrice,
        "phoneNumber": phoneNumber,
        "consultantType": consultantType,
        "state": state,
        "city": city,
        "historicAveragePrice": historicAveragePrice,
        "postalAddress": postalAddress,
        "photo": photo,
      });
      if (response.statusCode == 200) {
        serverResponse = ServerResponse.fromJson(json.decode(response.body));
        serverResponse.statusCode = 200;
      } else if (response.statusCode == 400) {
        serverResponse = ServerResponse.fromJson(json.decode(response.body));
        serverResponse.statusCode = 400;
      } else {
        serverResponse.message = 'Error de conexion';
        serverResponse.statusCode = 400;
      }
    } catch (e) {
      print('ERROR: $TAG: registerConsultant: ' + e.toString());
      serverResponse.statusCode = 1;
      serverResponse.message = 'Error de conexion';
    }
    return serverResponse;
  }

  Future<ServerResponse> registerEntrepreneur({
    @required String username,
    @required String email,
    @required String password,
    @required String type,
    @required String firstName,
    @required String lastName,
    @required String birthdate,
    @required String phoneNumber,
    @required String state,
    @required String city,
    @required String postalAddress,
    @required String photo,
  }) async {
    ServerResponse serverResponse = new ServerResponse();
    try {
      String url = NetworkUtils.path + 'user/signup';
      final response = await http.post(url, body: {
        "username": username,
        "email": email,
        "password": password,
        "type": type,
        "firstName": firstName,
        "lastName": lastName,
        "birthdate": birthdate,
        "phoneNumber": phoneNumber,
        "state": state,
        "city": city,
        "postalAddress": postalAddress,
        "photo": photo,
      });
      if (response.statusCode == 200) {
        serverResponse = ServerResponse.fromJson(json.decode(response.body));
        serverResponse.statusCode = 200;
      } else if (response.statusCode == 400) {
        serverResponse = ServerResponse.fromJson(json.decode(response.body));
        serverResponse.statusCode = 400;
      } else {
        serverResponse.message = 'Error de conexion';
        serverResponse.statusCode = 400;
      }
    } catch (e) {
      print('ERROR: $TAG: registerConsultant: ' + e.toString());
      serverResponse.statusCode = 1;
      serverResponse.message = 'Error de conexion';
    }
    return serverResponse;
  }

  void changeIsFirst(bool value) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setBool('isFirst', value);
  }
}
