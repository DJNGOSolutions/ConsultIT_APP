import 'package:consult_it_app/pages/faqbot_page.dart';
import 'package:consult_it_app/pages/home_page.dart';
import 'package:consult_it_app/pages/login_page.dart';
import 'package:consult_it_app/pages/registration_page.dart';
import 'package:flutter/material.dart';

const String FAQ_BOT_ROUTE = 'FAQ_BOT_ROUTE';
const String HOME_ROUTE = 'HOME_ROUTE';
const String REGISTRATION_ROUTE = 'REGISTRATION_ROUTE';
const String LOGIN_ROUTE = 'LOGIN_ROUTE';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case '/':
      return MaterialPageRoute(builder: (context) => LoginPage());
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
    default:
      return MaterialPageRoute(builder: (context) => LoginPage());
  }
}
