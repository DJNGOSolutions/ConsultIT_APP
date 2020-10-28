import 'package:flutter/material.dart';

class Business {
  String legalName;
  String comercialName;
  String email;
  String phoneNumber;
  String address;
  String state;
  String city;
  String businessLine;
  String businessSector;

  Business(
      {@required this.legalName,
      this.comercialName = "",
      @required this.address,
      @required this.businessLine,
      @required this.businessSector,
      @required this.city,
      @required this.email,
      @required this.phoneNumber,
      @required this.state});
}
