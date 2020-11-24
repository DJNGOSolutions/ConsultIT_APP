import 'package:consult_it_app/bloc/authentication_bloc.dart';
import 'package:consult_it_app/controllers/home_controller.dart';
import 'package:consult_it_app/events/authentication_events.dart';
import 'package:consult_it_app/pages/login_page.dart';
import 'package:consult_it_app/pages/registration_page.dart';
import 'package:consult_it_app/pages/splash_page.dart';
import 'package:consult_it_app/repositories/business_repository.dart';
import 'package:consult_it_app/repositories/consultant_repository.dart';
import 'package:consult_it_app/repositories/entrepreneur_repository.dart';
import 'package:consult_it_app/repositories/user_repository.dart';
import 'package:consult_it_app/states/authentication_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthenticationBloc _authenticationBloc;

  @override
  void initState() {
    _authenticationBloc = AuthenticationBloc(
        userRepository: UserRepository(),
        consultantRepository: ConsultantRepository(),
        entrepreneurRepository: EntrepreneurRepository(),
        businessRepository: BusinessRepository());
    _authenticationBloc.add(AppStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => _authenticationBloc,
      child: WillPopScope(
        onWillPop: () => Future.value(false),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: BlocListener<AuthenticationBloc, AuthenticationState>(
              cubit: _authenticationBloc,
              listener: (BuildContext context, state) {},
              child: BlocBuilder(
                  cubit: _authenticationBloc,
                  //ignore: missing_return
                  builder: (BuildContext context, AuthenticationState state) {
                    return AnimatedSwitcher(
                      duration: Duration(milliseconds: 250),
                      switchOutCurve: Threshold(0.05),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(0.25, 0),
                            end: Offset.zero,
                          ).animate(animation),
                          child: child,
                        );
                      },
                      child: _buildPage(context, state),
                    );
                  }),
            )),
      ),
    );
  }

  _buildPage(BuildContext context, AuthenticationState state) {
    if (state is AuthenticationUninitialized) {
      return SplashPage();
    } else if (state is AuthenticationAuthenticated) {
      return HomeController(
        authenticationBloc: _authenticationBloc,
        userType: state.userType,
      );
    } else if (state is AuthenticationUnauthenticated) {
      return Scaffold(
        resizeToAvoidBottomInset: true,
        resizeToAvoidBottomPadding: false,
        body: LoginPage(
          authenticationBloc: _authenticationBloc,
        ),
      );
    } else if (state is AuthenticationLoading) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: LoadingIndicator(),
      );
    } else if (state is RegistrationForm) {
      return RegistrationPage(
        authenticationBloc: _authenticationBloc,
      );
    }
  }
}
