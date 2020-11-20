import 'package:consult_it_app/models/consultant_model.dart';
import 'package:consult_it_app/models/entrepreneur_model.dart';
import 'package:consult_it_app/repositories/consultant_repository.dart';
import 'package:consult_it_app/repositories/entrepreneur_repository.dart';
import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {}

class AuthenticationUninitialized extends AuthenticationState {
  @override
  String toString() => 'AuthenticationUninitialized';
}

class AuthenticationAuthenticated extends AuthenticationState {
  final int userType;

  AuthenticationAuthenticated(this.userType);
  @override
  String toString() => 'AuthenticationAuthenticated';
}

class AuthenticationUnauthenticated extends AuthenticationState {
  @override
  String toString() => 'AuthenticationUnauthenticated';
}

class AuthenticationLoading extends AuthenticationState {
  @override
  String toString() => 'AuthenticationLoading';
}

class RegistrationForm extends AuthenticationState {
  @override
  String toString() => 'NuevaMatriculaOptions';
}
