import 'package:bloc/bloc.dart';
import 'package:consult_it_app/events/authentication_events.dart';
import 'package:consult_it_app/repositories/user_repository.dart';
import 'package:consult_it_app/states/authentication_states.dart';
import 'package:consult_it_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;

  AuthenticationBloc({@required this.userRepository})
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
        // TODO: AUTENTICAR USUARIO
        print('Usuario: ${event.username} \nContraseña: ${event.password}');
        //Autenticando credenciales ingresadas
        final userModel = await userRepository.authenticate(
            username: event.username, password: event.password);
        if (userModel != null && !userModel.tipo.contains(' ')) {
          userRepository.user = userModel;
          Fluttertoast.showToast(
              msg: 'Bienvenido/a',
              backgroundColor: MyColors.mainColor,
              textColor: MyColors.accentColor);
          yield AuthenticationAuthenticated();
        } else {
          Fluttertoast.showToast(
              msg: 'Error de autenticacion: ${userModel.tipo}');
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
          consultantType: event.giro,
          referencePrice: event.precioBase);
      if (serverResponse != null) {
        if (serverResponse.statusCode == 201) {
          Fluttertoast.showToast(msg: serverResponse.message);
          yield AuthenticationAuthenticated();
        } else {
          Fluttertoast.showToast(msg: serverResponse.message);
          yield AuthenticationUnauthenticated();
        }
      } else {
        Fluttertoast.showToast(msg: 'Error de conexion');
        yield AuthenticationUnauthenticated();
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
        if (serverResponse.statusCode == 201) {
          Fluttertoast.showToast(msg: serverResponse.message);
          yield AuthenticationAuthenticated();
        } else {
          Fluttertoast.showToast(msg: serverResponse.message);
          yield AuthenticationUnauthenticated();
        }
      } else {
        Fluttertoast.showToast(msg: 'Error de conexion');
        yield AuthenticationUnauthenticated();
      }
    }
    if (event is BackToLogin) {
      yield AuthenticationUnauthenticated();
    }
  }
}
