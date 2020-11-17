import 'package:bloc/bloc.dart';
import 'package:consult_it_app/events/authentication_events.dart';
import 'package:consult_it_app/models/user_model.dart';
import 'package:consult_it_app/repositories/user_repository.dart';
import 'package:consult_it_app/states/authentication_states.dart';
import 'package:consult_it_app/utils/toast_utils.dart';
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
      yield AuthenticationLoading();
      // TODO: AUTENTICAR USUARIO
      print('Usuario: ${event.username} \nContraseña: ${event.password}');
      //Autenticando credenciales ingresadas
      final userModel = await userRepository.authenticate(
          username: event.username, password: event.password);
      if (userModel != null && !userModel.tipo.contains(' ')) {
        userRepository.user = userModel;
        yield AuthenticationAuthenticated();
      } else {
        Fluttertoast.showToast(
            msg: 'Error de autenticacion: ${userModel.tipo}');
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is ToRegistrationForm) {
      // TODO: ENVIAR AL SERVIDOR INFORMACION DEL USUARIO
      yield RegistrationForm();
    }

    if (event is RegisterConsultant) {
      yield AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      // TODO: ELIMINAR TOKEN DE SESION
      yield AuthenticationUnauthenticated();
    }

    if (event is RegisterEntrepreneur) {
      yield AuthenticationAuthenticated();
    }

    if (event is BackToLogin) {
      yield AuthenticationUnauthenticated();
    }
  }
}
