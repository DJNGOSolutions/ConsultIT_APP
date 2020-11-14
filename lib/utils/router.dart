import 'package:consult_it_app/models/consultant_model.dart';
import 'package:consult_it_app/models/user_model.dart';
import 'package:consult_it_app/pages/addBusiness_page.dart';
import 'package:consult_it_app/pages/businessProfile_page.dart';
import 'package:consult_it_app/pages/consultantDetails_page.dart';
import 'package:consult_it_app/pages/consultantProfile_page.dart';
import 'package:consult_it_app/pages/consultantsList_page.dart';
import 'package:consult_it_app/pages/faqbot_page.dart';
import 'package:consult_it_app/pages/home_page.dart';
import 'package:consult_it_app/pages/login_page.dart';
import 'package:consult_it_app/pages/profile_page.dart';
import 'package:consult_it_app/pages/registration_page.dart';
import 'package:consult_it_app/pages/splash_page.dart';
import 'package:flutter/material.dart';

const String FAQ_BOT_ROUTE = 'FAQ_BOT_ROUTE';
const String HOME_ROUTE = 'HOME_ROUTE';
const String REGISTRATION_ROUTE = 'REGISTRATION_ROUTE';
const String LOGIN_ROUTE = 'LOGIN_ROUTE';
const String SPLASH_ROUTE = 'SPLASH_ROUTE';
const String ADD_BUSINESS_ROUTE = 'ADD_BUSINESS_ROUTE';
const String PROFILE_PAGE = 'PROFILE_PAGE';
const String BUSINESS_PROFILE_PAGE = 'BUSINESS_PROFILE_PAGE';
const String CONSULTANTS_LIST_PAGE = 'CONSULTANTS_LIST_PAGE';
const String CONSULTANT_DETAILS_PAGE = 'CONSULTANT_DETAILS_PAGE';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case '/':
      return MaterialPageRoute(builder: (context) => SplashPage());
    case FAQ_BOT_ROUTE:
      return MaterialPageRoute(builder: (context) => FaqBotPage());
      break;
    case HOME_ROUTE:
      return MaterialPageRoute(builder: (context) => HomePage());
      break;
    case REGISTRATION_ROUTE:
      return MaterialPageRoute(builder: (context) => RegistrationPage());
      break;
    case LOGIN_ROUTE:
      return MaterialPageRoute(builder: (context) => LoginPage());
      break;
    case SPLASH_ROUTE:
      return MaterialPageRoute(builder: (context) => SplashPage());
      break;
    case ADD_BUSINESS_ROUTE:
      return MaterialPageRoute(builder: (context) => AddBusinessPage());
      break;
    case PROFILE_PAGE:
      return MaterialPageRoute(builder: (context) => ProfilePage());
    case BUSINESS_PROFILE_PAGE:
      return MaterialPageRoute(
          builder: (context) => BusinessProfilePage(
                imgPath: 'assets/images/icons/FolderDataColor.png',
                heroTag: 'BusinessImage',
                businessName: 'Venta de textiles S.A. de C.V.',
              ));
    case CONSULTANTS_LIST_PAGE:
      return MaterialPageRoute(
          builder: (context) => ConsultantsListPage(
                heroTag: 'ConsultantName',
                imgPath: 'assets/images/icons/BookProfesionals.png',
                optionName: 'Consultar cartera de asesores',
              ));
    case CONSULTANT_DETAILS_PAGE:
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
      return MaterialPageRoute(
          builder: (context) => ConsultantDetailsPage(
                heroTag: 'ProfileImageRonald Vega',
                imgPath: 'assets/images/icons/profile.png',
                consultant: consultant,
              ));
    default:
      return MaterialPageRoute(builder: (context) => LoginPage());
  }
}
