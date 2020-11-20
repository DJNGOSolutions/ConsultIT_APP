import 'package:bloc/bloc.dart';
import 'package:consult_it_app/events/authentication_events.dart';
import 'package:consult_it_app/repositories/consultant_repository.dart';
import 'package:consult_it_app/repositories/user_repository.dart';
import 'package:consult_it_app/states/authentication_states.dart';
import 'package:consult_it_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;
  final ConsultantRepository consultantRepository;

  AuthenticationBloc(
      {@required this.userRepository, @required this.consultantRepository})
      : super(AuthenticationUninitialized());

  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      yield AuthenticationUninitialized();

      // TODO: Call verify token from repository
      yield AuthenticationUnauthenticated();
    }

    if (event is LoggedIn) {
      if (event.password.isEmpty || event.password.isEmpty) {
        Fluttertoast.showToast(
            msg: 'Usuario o contraseña incorrectos.',
            backgroundColor: Colors.red);
      } else {
        yield AuthenticationLoading();
        print('Usuario: ${event.username} \nContraseña: ${event.password}');
        //Autenticando credenciales ingresadas
        final userModel = await userRepository.authenticate(
            username: event.username, password: event.password);
        if (userModel != null && !userModel.tipo.contains(' ')) {
          userRepository.user = userModel;
          if (userModel.tipo.toUpperCase() == 'Consultant'.toUpperCase()) {
            final consultantModel = await consultantRepository
                .findConsultantByUsername(username: userModel.username);
            if (consultantModel != null) {
              consultantModel.user = userModel;
              consultantRepository.consultant = consultantModel;
              Fluttertoast.showToast(
                  msg:
                      'Bienvenido/a ${consultantModel.firstname} ${consultantModel.lastName}',
                  backgroundColor: MyColors.mainColor,
                  textColor: MyColors.accentColor);
              yield AuthenticationAuthenticated();
            } else {
              Fluttertoast.showToast(
                  msg: 'Error de autenticacion del perfil de ${userModel.tipo}',
                  backgroundColor: MyColors.mainColor,
                  textColor: MyColors.accentColor);
              yield AuthenticationUnauthenticated();
            }
          } else {
            Fluttertoast.showToast(
                msg: 'Error de autenticacion del perfil de ${userModel.tipo}',
                backgroundColor: MyColors.mainColor,
                textColor: MyColors.accentColor);
            yield AuthenticationUnauthenticated();
          }
        } else {
          Fluttertoast.showToast(
              msg: 'Error de autenticacion del perfil de ${userModel.tipo}');
          yield AuthenticationUnauthenticated();
        }
      }
    }

    if (event is ToRegistrationForm) {
      // TODO: ENVIAR AL SERVIDOR INFORMACION DEL USUARIO
      yield RegistrationForm();
    }

    if (event is RegisterConsultant) {
      yield AuthenticationLoading();
      final serverResponse = await userRepository.registerConsultant(
          username: event.usuario,
          email: event.correo,
          password: event.contra,
          type: 'consultant',
          firstName: event.nombres,
          lastName: event.apellidos,
          birthdate: event.fechaNac,
          phoneNumber: event.telefono,
          state: event.departamento,
          city: event.municipio,
          postalAddress: event.codPostal,
          photo: '',
          historicAveragePrice: 0,
          consultantType: event.giro,
          referencePrice: event.precioBase);
      if (serverResponse != null) {
        if (serverResponse.statusCode == 200) {
          Fluttertoast.showToast(
              msg: serverResponse.message,
              backgroundColor: MyColors.mainColor,
              textColor: MyColors.accentColor);
          yield AuthenticationUnauthenticated();
        } else {
          Fluttertoast.showToast(
              msg: serverResponse.message, backgroundColor: Colors.red);
          yield AuthenticationUnauthenticated();
        }
      } else {
        Fluttertoast.showToast(
            msg: 'Error de conexion', backgroundColor: Colors.red);
        yield RegistrationForm();
      }
    }
    if (event is LoggedOut) {
      yield AuthenticationLoading();
      // TODO: ELIMINAR TOKEN DE SESION
      yield AuthenticationUnauthenticated();
    }

    if (event is RegisterEntrepreneur) {
      yield AuthenticationLoading();
      final serverResponse = await userRepository.registerEntrepreneur(
        username: event.usuario,
        email: event.correo,
        password: event.contra,
        type: 'entrepreneur',
        firstName: event.nombres,
        lastName: event.apellidos,
        birthdate: event.fechaNac,
        phoneNumber: event.telefono,
        state: event.departamento,
        city: event.municipio,
        postalAddress: event.codPostal,
        photo: '',
      );
      if (serverResponse != null) {
        if (serverResponse.statusCode == 200) {
          Fluttertoast.showToast(
              msg: serverResponse.message,
              backgroundColor: MyColors.mainColor,
              textColor: MyColors.accentColor);
          yield AuthenticationUnauthenticated();
        } else {
          Fluttertoast.showToast(
              msg: serverResponse.message, backgroundColor: Colors.red);
          yield RegistrationForm();
        }
      } else {
        Fluttertoast.showToast(
            msg: 'Error de conexion', backgroundColor: Colors.red);
        yield RegistrationForm();
      }
    }
    if (event is BackToLogin) {
      yield AuthenticationUnauthenticated();
    }
  }
}
