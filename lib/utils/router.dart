import 'package:consult_it_app/faqbot_page.dart';
import 'package:consult_it_app/home_page.dart';
import 'package:flutter/material.dart';

const String FAQ_BOT = 'FAQBOT';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case '/':
      return MaterialPageRoute(builder: (context) => HomePage());
    case FAQ_BOT:
      return MaterialPageRoute(builder: (context) => FaqBotPage());
      break;
    default:
      return MaterialPageRoute(builder: (context) => HomePage());
  }
}
