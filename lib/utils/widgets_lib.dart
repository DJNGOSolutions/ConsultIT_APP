import 'package:consult_it_app/models/faqmessage_model.dart';
import 'package:consult_it_app/utils/router.dart';
import 'package:consult_it_app/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/router.dart';

Widget faqbot(BuildContext context) {
  return FloatingActionButton(
    backgroundColor: MyColors.mainColor,
    foregroundColor: MyColors.accentColor,
    onPressed: () => Navigator.pushNamed(context, FAQ_BOT_ROUTE),
    tooltip: 'Preguntanos lo que desees',
    child: Icon(Icons.message),
  );
}

Widget faqMessage(
    {@required FAQMessage message, @required BuildContext context}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: message.type
              ? _userMessage(context, message)
              : _botMessage(context, message),
        ),
      ),
      Divider(
        height: 2,
      )
    ],
  );
}

List<Widget> _botMessage(BuildContext context, FAQMessage message) {
  return <Widget>[
    Container(
      margin: const EdgeInsets.only(right: 16.0),
      child: CircleAvatar(
        child: Text(
          'CI',
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Colors.purpleAccent,
      ),
    ),
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(message.sender,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          Container(
            margin: const EdgeInsets.only(top: 5.0),
            child: Text(message.message, style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    ),
  ];
}

List<Widget> _userMessage(context, FAQMessage message) {
  return <Widget>[
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(message.sender,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          Container(
            margin: const EdgeInsets.only(top: 5.0),
            child: Text(message.message, style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    ),
    Container(
      margin: const EdgeInsets.only(left: 16.0),
      child: CircleAvatar(
          child: new Text(
        message.sender.substring(0, 1),
        style: TextStyle(fontSize: 20),
      )),
    ),
  ];
}

// Campo para ingresar texto
inputField(
        {@required String hintText,
        @required String labelText,
        @required IconData icon,
        bool uppercase = true,
        bool bold = true,
        bool obscure = false}) =>
    TextField(
      obscureText: obscure,
      decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: MyColors.textFieldColor,
          ),
          contentPadding: EdgeInsets.only(left: 8, top: 2, bottom: 2, right: 4),
          labelText: uppercase ? labelText.toUpperCase() : labelText,
          labelStyle: TextStyle(
              fontFamily: Fonts.primaryFont,
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
              color: MyColors.textFieldColor),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
              fontSize: 14,
              fontFamily: Fonts.primaryFont,
              color: MyColors.textFieldColor.withOpacity(0.7))),
    );

customButton(
        {@required BuildContext context,
        @required String labelText,
        bool isMain = true,
        bool isAccent = false,
        @required String route,
        double fontSize = 14.0}) =>
    GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        constraints: BoxConstraints(minWidth: 100, maxWidth: 150),
        height: 45,
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isMain
                ? MyColors.mainColor
                : isAccent ? MyColors.accentColor : MyColors.secondaryColor,
            boxShadow: [
              BoxShadow(
                  color: isAccent
                      ? Colors.grey.withOpacity(0.4)
                      : MyColors.mainColor.withOpacity(0.4),
                  blurRadius: 8.0,
                  offset: Offset(0, 7))
            ]),
        child: Center(
          child: FittedBox(
            child: Text(
              labelText.toUpperCase(),
              style: TextStyle(
                  fontFamily: Fonts.secondaryFont,
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ),
    );
