import 'package:consult_it_app/models/faqmessage_model.dart';
import 'package:consult_it_app/utils/router.dart';
import 'package:consult_it_app/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/router.dart';

Widget faqbot(BuildContext context) {
  return FloatingActionButton(
    onPressed: () => Navigator.pushNamed(context, FAQ_BOT_ROUTE),
    tooltip: 'Incrementar',
    child: Icon(Icons.add),
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
        {String hintText,
        String labelText,
        IconData icon,
        bool uppercase,
        bool bold,
        bool obscure = false}) =>
    TextField(
      obscureText: obscure,
      decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: MyColors.secondaryColor,
          ),
          contentPadding: EdgeInsets.only(left: 8, top: 2, bottom: 2, right: 4),
          labelText: uppercase ? labelText.toUpperCase() : labelText,
          labelStyle: TextStyle(
              fontFamily: Fonts.primaryFont,
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
              color: Color.fromRGBO(37, 117, 191, 1)),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
              fontFamily: Fonts.primaryFont,
              color: Color.fromRGBO(37, 117, 191, .6))),
    );
