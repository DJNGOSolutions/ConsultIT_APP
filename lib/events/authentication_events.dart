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
  @override
  String toString() => 'RegisterConsultant';
}

class RegisterEntrepreneur extends AuthenticationEvent {
  @override
  String toString() => 'RegisterEntrepreneur';
}
