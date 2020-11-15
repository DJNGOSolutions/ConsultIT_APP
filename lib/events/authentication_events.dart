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

class BackNuevaMatriculaOptions extends AuthenticationEvent {
  @override
  String toString() => 'BackNuevaMatriculaOptions';
}

class ToNuevaMatriculaForm extends AuthenticationEvent {
  @override
  String toString() => 'ToNuevaMatriculaForm';
}

class ToNuevaMatriculaOptions extends AuthenticationEvent {
  @override
  String toString() => 'ToNuevaMatriculaOptions';
}

class InfoFormSubmit extends AuthenticationEvent {
  @override
  String toString() => 'InfoFormSubmit';
}

class InfoFormCancel extends AuthenticationEvent {
  @override
  String toString() => 'InfoFormCancel';
}
