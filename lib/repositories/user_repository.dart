import 'package:consult_it_app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  User _user;
  Future<User> authenticate({
    @required String username,
  }) async {
    // TODO: Authenticate User from server
    _user = new User(
      username: 'RonaldVega',
      email: 'ronald.vega48@gmail.com',
      password: '******',
      tipo: '0',
    );
    return _user;
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
