import 'package:flutter/material.dart';

class User {
  String username;
  String email;
  String password;
  String tipo;

  User(
      {@required this.username,
      @required this.email,
      @required this.password,
      @required this.tipo});
}