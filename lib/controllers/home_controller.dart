import 'package:consult_it_app/bloc/authentication_bloc.dart';
import 'package:consult_it_app/bloc/home_bloc.dart';
import 'package:consult_it_app/events/home_events.dart';
import 'package:consult_it_app/models/consultant_model.dart';
import 'package:consult_it_app/models/user_model.dart';
import 'package:consult_it_app/pages/businessProfile_page.dart';
import 'package:consult_it_app/pages/consultantDetails_page.dart';
import 'package:consult_it_app/pages/consultantsList_page.dart';
import 'package:consult_it_app/pages/editProfile_page.dart';
import 'package:consult_it_app/pages/faqbot_page.dart';
import 'package:consult_it_app/pages/home_page.dart';
import 'package:consult_it_app/pages/profile_page.dart';
import 'package:consult_it_app/repositories/user_repository.dart';
import 'package:consult_it_app/states/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeController extends StatefulWidget {
  final AuthenticationBloc authenticationBloc;

  const HomeController({Key key, @required this.authenticationBloc})
      : super(key: key);
  @override
  _HomeControllerState createState() => _HomeControllerState();
}

class _HomeControllerState extends State<HomeController> {
  // ignore: close_sinks
  HomeBloc _homeBloc;
  AuthenticationBloc get authenticationBloc => widget.authenticationBloc;

  @override
  void initState() {
    _homeBloc = HomeBloc(OnHomePage(), userRepository: UserRepository());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => _homeBloc,
      child: WillPopScope(
        onWillPop: () => Future.value(false),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: BlocListener<HomeBloc, HomeState>(
              cubit: _homeBloc,
              listener: (BuildContext context, state) {},
              child: BlocBuilder(
                  cubit: _homeBloc,
                  //ignore: missing_return
                  builder: (BuildContext context, HomeState state) {
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

  _buildPage(BuildContext context, HomeState state) {
    if (state is OnHomePage) {
      return HomePage(
        authenticationBloc: authenticationBloc,
        homeBloc: _homeBloc,
      );
    } else if (state is OnAddBusinessPage) {
      return AddNewBusiness();
    } else if (state is OnMyBusinessDetails) {
      return BusinessProfilePage(
          imgPath: 'assets/images/icons/FolderDataColor.png',
          heroTag: 'BusinessImage',
          businessName: 'Venta de textiles S.A. de C.V.',
          homeBloc: _homeBloc);
    } else if (state is OnConsultantsList) {
      return ConsultantsListPage(
        heroTag: 'ConsultantName',
        imgPath: 'assets/images/icons/BookProfesionals.png',
        optionName: 'Cartera de asesores',
        homeBloc: _homeBloc,
      );
    } else if (state is OnConsultantsProfilePage) {
      Consultant consultant = new Consultant(
          firstname: 'Fernando',
          lastName: 'Hernandez',
          deegre: 'Licenciado en Ciencias de la Economia',
          photo:
              'https://content.thriveglobal.com/wp-content/uploads/2018/12/profile21.jpg',
          birthdate: '08/05/1993',
          referencePrice: 4.50,
          historicAveragePrice: 6.50,
          phoneNumber: '6547 8897',
          averageRating: 4.8,
          consultantType: 'Fintech',
          state: 'La Libertad',
          city: 'Antiguo Cuscatlan',
          user: User(
              username: 'FernandoHdz',
              email: 'fer.hndz@gmail.com',
              password: '*********',
              tipo: '0'));
      return ConsultantDetailsPage(
          heroTag: 'ProfileImageRonald Vega',
          imgPath: 'assets/images/icons/profile.png',
          consultant: consultant,
          homeBloc: _homeBloc);
    } else if (state is OnProfilePage) {
      return ProfilePage(homeBloc: _homeBloc);
    } else if (state is OnEditProfilePage) {
      return EditProfilePage(heroTag: 'Image', homeBloc: _homeBloc);
    } else if (state is OnFAQBotPage) {
      return FaqBotPage(
        homeBloc: _homeBloc,
      );
    }
  }
}
