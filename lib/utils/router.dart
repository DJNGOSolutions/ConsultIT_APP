import 'package:consult_it_app/pages/faqbot_page.dart';
import 'package:consult_it_app/pages/home_page.dart';
import 'package:flutter/material.dart';

const String FAQ_BOT_ROUTE = 'FAQ_BOT_ROUTE';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case '/':
      return MaterialPageRoute(builder: (context) => HomePage());
    case FAQ_BOT_ROUTE:
      return MaterialPageRoute(builder: (context) => FaqBotPage());
      break;
    default:
      return MaterialPageRoute(builder: (context) => HomePage());
  }
}
