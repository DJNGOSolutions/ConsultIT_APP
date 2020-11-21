import 'package:bloc/bloc.dart';
import 'package:consult_it_app/events/authentication_events.dart';
import 'package:consult_it_app/models/business_model.dart';
import 'package:consult_it_app/repositories/business_repository.dart';
import 'package:consult_it_app/repositories/consultant_repository.dart';
import 'package:consult_it_app/repositories/entrepreneur_repository.dart';
import 'package:consult_it_app/repositories/user_repository.dart';
import 'package:consult_it_app/states/authentication_states.dart';
import 'package:consult_it_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;
  final ConsultantRepository consultantRepository;
  final EntrepreneurRepository entrepreneurRepository;
  final BusinessRepository businessRepository;

  AuthenticationBloc(
      {@required this.userRepository,
      @required this.consultantRepository,
      @required this.entrepreneurRepository,
      @required this.businessRepository})
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
        //Se verifica si el valor del usuario es diferente de null y si el tipo es valido
        if (userModel != null && !userModel.tipo.contains(' ')) {
          //Se le asigna el valor a la variable del repositorio
          userRepository.user = userModel;
          if (userModel.tipo.toUpperCase() == 'Consultant'.toUpperCase()) {
            //Si es consultor se obtiene la informacion del consultor
            final consultantModel = await consultantRepository
                .findOneByUsername(username: userModel.username);
            if (consultantModel != null) {
              //Si la peticion del consultor es valida se da accesso a la app
              consultantModel.user = userModel;
              consultantRepository.consultant = consultantModel;
              Fluttertoast.showToast(
                  msg:
                      'Bienvenido/a ${consultantModel.firstname} ${consultantModel.lastName}',
                  backgroundColor: MyColors.mainColor,
                  textColor: MyColors.accentColor);
              yield AuthenticationAuthenticated(0);
            } else {
              //Si hay error al obtener la informacion del consultor
              Fluttertoast.showToast(
                  msg: 'Error de autenticacion del perfil de ${userModel.tipo}',
                  backgroundColor: MyColors.mainColor,
                  textColor: MyColors.accentColor);
              yield AuthenticationUnauthenticated();
            }
          } else {
            //Si el usuario no es consultor entonces se entiende que es entrepreneur
            //Se obtiene la informacion del entrepreneur
            final entrepreneurModel = await entrepreneurRepository
                .findOneByUsername(username: userModel.username);
            if (entrepreneurModel != null) {
              //Si la informacion para el entrepreneur no es null se le asigna al valor del repositorio
              entrepreneurModel.user = userModel;
              //Si es un entrepreneur valido se obtiene la lista de negocios correspondientes a ese usuario
              List<Business> myBusinesses = await businessRepository
                  .findAllBusinesses(username: userModel.username);
              if (myBusinesses != null) {
                entrepreneurModel.businesses = myBusinesses;
                entrepreneurRepository.entrepreneur = entrepreneurModel;
                Fluttertoast.showToast(
                    msg:
                        'Bienvenido/a ${entrepreneurModel.firstName} ${entrepreneurModel.lastName}',
                    backgroundColor: MyColors.mainColor,
                    textColor: MyColors.accentColor);
                yield AuthenticationAuthenticated(1);
              } else {
                Fluttertoast.showToast(
                    msg: 'Error al obtener sus comercios',
                    backgroundColor: Colors.red);
                yield AuthenticationUnauthenticated();
              }
            } else {
              //Error al obtener la informacion del entrepreneur
              Fluttertoast.showToast(
                  msg: 'Error de autenticacion del perfil de ${userModel.tipo}',
                  backgroundColor: MyColors.mainColor,
                  textColor: MyColors.accentColor);
              yield AuthenticationUnauthenticated();
            }
          }
        } else {
          Fluttertoast.showToast(
              msg: 'Error de autenticacion del perfil de ${userModel.tipo}');
          yield AuthenticationUnauthenticated();
        }
      }
    }

    if (event is ToRegistrationForm) {
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
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      _prefs.clear();
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
