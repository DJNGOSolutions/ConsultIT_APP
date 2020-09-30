import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget faqbot(BuildContext context) {
  return FloatingActionButton(
    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: null)),
    tooltip: 'Incrementar',
    child: Icon(Icons.add),
  );
}
