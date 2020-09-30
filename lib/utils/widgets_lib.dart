import 'package:consult_it_app/models/faqmessage_model.dart';
import 'package:consult_it_app/utils/router.dart';
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
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: message.type
          ? _userMessage(context, message)
          : _botMessage(context, message),
    ),
  );
}

List<Widget> _botMessage(BuildContext context, FAQMessage message) {
  return <Widget>[
    Container(
      margin: const EdgeInsets.only(right: 16.0),
      child: CircleAvatar(child: Text('CI')),
    ),
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(message.sender, style: TextStyle(fontWeight: FontWeight.bold)),
          Container(
            margin: const EdgeInsets.only(top: 5.0),
            child: Text(message.message),
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
          Text(message.sender, style: Theme.of(context).textTheme.subtitle1),
          Container(
            margin: const EdgeInsets.only(top: 5.0),
            child: Text(message.message),
          ),
        ],
      ),
    ),
    Container(
      margin: const EdgeInsets.only(left: 16.0),
      child: CircleAvatar(child: new Text(message.sender.substring(1, 2))),
    ),
  ];
}
