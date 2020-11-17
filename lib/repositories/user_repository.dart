import 'dart:convert';

import 'package:consult_it_app/models/user_model.dart';
import 'package:consult_it_app/utils/network_utils.dart';
import 'package:consult_it_app/utils/toast_utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  User user = new User();
  String TAG = 'UserRepository';

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

  Future<bool> verifyFirstTime() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    if (_prefs.containsKey('isFirst')) {
      if (_prefs.getBool('isFirst')) {
        return true;
      } else {
        return false;
      }
    } else {
      _prefs.setBool('isFirst', true);
      return true;
    }
  }

  void changeIsFirst(bool value) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setBool('isFirst', value);
  }
}
