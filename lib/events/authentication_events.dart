import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  AuthenticationEvent([List props = const []]) : super(props);
}

class AppStarted extends AuthenticationEvent {
  @override
  String toString() => 'AppStarted';
}

class LoggedIn extends AuthenticationEvent {
  final String username;

  LoggedIn({this.username}) : super([username]);

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
