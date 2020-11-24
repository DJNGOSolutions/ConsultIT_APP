import 'package:consult_it_app/bloc/authentication_bloc.dart';
import 'package:consult_it_app/bloc/home_bloc.dart';
import 'package:consult_it_app/pages/AnalizeMarket_page.dart';
import 'package:consult_it_app/pages/addBusiness_page.dart';
import 'package:consult_it_app/pages/businessProfile_page.dart';
import 'package:consult_it_app/pages/businessesList_page.dart';
import 'package:consult_it_app/pages/consultantDetails_page.dart';
import 'package:consult_it_app/pages/consultantsList_page.dart';
import 'package:consult_it_app/pages/editBusiness_page.dart';
import 'package:consult_it_app/pages/editProfile_page.dart';
import 'package:consult_it_app/pages/faqbot_page.dart';
import 'package:consult_it_app/pages/home_page.dart';
import 'package:consult_it_app/states/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeController extends StatefulWidget {
  final AuthenticationBloc authenticationBloc;
  final int userType; // 0: Consultant || 1: Entrepreneur

  const HomeController(
      {Key key, @required this.authenticationBloc, @required this.userType})
      : super(key: key);
  @override
  _HomeControllerState createState() => _HomeControllerState();
}

class _HomeControllerState extends State<HomeController> {
  // ignore: close_sinks
  HomeBloc _homeBloc;
  AuthenticationBloc get authenticationBloc => widget.authenticationBloc;
  int get userType => widget.userType;

  @override
  void initState() {
    _homeBloc = HomeBloc(OnHomePage(0),
        userRepository: authenticationBloc.userRepository,
        businessRepository: authenticationBloc.businessRepository,
        consultantRepository: authenticationBloc.consultantRepository,
        entrepreneurRepository: authenticationBloc.entrepreneurRepository);
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
        currentIndex: state.currentIndex,
      );
    } else if (state is OnAddBusinessPage) {
      return AddBusinessPage(
        homeBloc: _homeBloc,
      );
    } else if (state is OnMyBusinessDetails) {
      return BusinessProfilePage(
        imgPath: 'assets/images/icons/FolderDataColor.png',
        heroTag: 'BusinessImage',
        homeBloc: _homeBloc,
        business: state.business,
      );
    } else if (state is OnEditBusinessPage) {
      return EditBusinessPage(
        heroTag: 'BusinessImage',
        homeBloc: _homeBloc,
        business: state.business,
      );
    } else if (state is OnConsultantsList) {
      return ConsultantsListPage(
        heroTag: 'ConsultantName',
        imgPath: 'assets/images/icons/BookProfesionals.png',
        optionName: 'Cartera de asesores',
        homeBloc: _homeBloc,
        consultant: state.consultants ?? [],
      );
    } else if (state is OnConsultantsProfilePage) {
      return ConsultantDetailsPage(
          heroTag: 'ProfileImage${state.consultant.user.id}',
          imgPath: isNotEmptyOrNull(state.consultant.photo)
              ? state.consultant.photo
              : 'assets/images/logo.png',
          hasPhoto: isNotEmptyOrNull(state.consultant.photo) ? true : false,
          consultant: state.consultant,
          homeBloc: _homeBloc);
    } else if (state is OnEditProfilePage) {
      return EditProfilePage(heroTag: 'Image', homeBloc: _homeBloc);
    } else if (state is OnFAQBotPage) {
      return FaqBotPage(
        homeBloc: _homeBloc,
      );
    } else if (state is OnAnalizeMarket) {
      return AnalizeMarketPage(
        homeBloc: _homeBloc,
        heroTag: 'AnalizeMarket',
        optionName: 'Analizar mercado',
      );
    } else if (state is OnMyBussinessesList) {
      return BusinessesListPage(
        homeBloc: _homeBloc,
        heroTag: 'BusinessName',
        optionName: 'Analizar mis comercios',
        myBusinesses: state.businesses,
      );
    }
  }

  bool isNotEmptyOrNull(String word) {
    if (word != null && word != '' && word != ' ' && word != 'null') {
      return true;
    } else {
      return false;
    }
  }
}
