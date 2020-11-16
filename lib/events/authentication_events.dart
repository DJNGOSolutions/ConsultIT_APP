import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AuthenticationEvent extends Equatable {
  AuthenticationEvent([List props = const []]) : super(props);
}

class AppStarted extends AuthenticationEvent {
  @override
  String toString() => 'AppStarted';
}

class LoggedIn extends AuthenticationEvent {
  final String username;
  final String password;

  LoggedIn({@required this.username, @required this.password})
      : super([username]);

  @override
  String toString() => 'LoggedIn';
}

class LoggedOut extends AuthenticationEvent {
  @override
  String toString() => 'LoggedOut';
}

class BackToLogin extends AuthenticationEvent {
  @override
  String toString() => 'BackToLogin';
}

class ToRegistrationForm extends AuthenticationEvent {
  @override
  String toString() => 'ToRegistrationForm';
}

class RegisterConsultant extends AuthenticationEvent {
  final String nombres,
      apellidos,
      correo,
      telefono,
      fechaNac,
      departamento,
      municipio,
      codPostal,
      usuario,
      contra,
      titulo,
      precioBase,
      giro;

  RegisterConsultant(
      {@required this.nombres,
      @required this.apellidos,
      @required this.correo,
      @required this.telefono,
      @required this.fechaNac,
      @required this.departamento,
      @required this.municipio,
      @required this.codPostal,
      @required this.usuario,
      @required this.contra,
      @required this.titulo,
      @required this.precioBase,
      @required this.giro});
  @override
  String toString() => 'RegisterConsultant';
}

class RegisterEntrepreneur extends AuthenticationEvent {
  final String nombres,
      apellidos,
      correo,
      telefono,
      fechaNac,
      departamento,
      municipio,
      codPostal,
      usuario,
      contra;

  RegisterEntrepreneur(
      {@required this.nombres,
      @required this.apellidos,
      @required this.correo,
      @required this.telefono,
      @required this.fechaNac,
      @required this.departamento,
      @required this.municipio,
      @required this.codPostal,
      @required this.usuario,
      @required this.contra});
  @override
  String toString() => 'RegisterEntrepreneur';
}
