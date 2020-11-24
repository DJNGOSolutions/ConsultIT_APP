import 'package:consult_it_app/models/business_model.dart';
import 'package:consult_it_app/models/consultant_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class HomeState extends Equatable {}

class OnHomePage extends HomeState {
  final int currentIndex;

  OnHomePage(this.currentIndex);
  @override
  String toString() => 'OnHomePage';
}

class OnAddBusinessPage extends HomeState {
  @override
  String toString() => 'MyBussinessesList';
}

class OnMyBussinessesList extends HomeState {
  final List<Business> businesses;

  OnMyBussinessesList({@required this.businesses});
  @override
  String toString() => 'MyBussinessesList';
}

class OnMyBusinessDetails extends HomeState {
  final Business business;

  OnMyBusinessDetails({@required this.business});
  @override
  String toString() => 'MyBusinessDetails';
}

class OnEditBusinessPage extends HomeState {
  final Business business;

  OnEditBusinessPage({@required this.business});
  @override
  String toString() => 'OnEditBusinessPage';
}

class OnWebBrowser extends HomeState {
  @override
  String toString() => 'OnWebBrowser';
}

class OnConsultantsList extends HomeState {
  final List<Consultant> consultants;

  OnConsultantsList({@required this.consultants});
  @override
  String toString() => 'ConsultantsList';
}

class OnConsultantsProfilePage extends HomeState {
  final Consultant consultant;

  OnConsultantsProfilePage({@required this.consultant});

  @override
  String toString() => 'OnConsultantsProfilePage';
}

class OnProfilePage extends HomeState {
  @override
  String toString() => 'OnProfilePage';
}

class OnEditProfilePage extends HomeState {
  @override
  String toString() => 'OnEditProfilePage';
}

class OnFAQBotPage extends HomeState {
  @override
  String toString() => 'OnFAQBotPage';
}

class OnAnalizeMarket extends HomeState {
  @override
  String toString() => 'OnAnalizeMarket';
}

class ChangeHomeContainer extends HomeState {
  final int currentIndex;

  ChangeHomeContainer(this.currentIndex);
  @override
  String toString() => 'ChangeHomeContainer';
}

class OnAnalyzeBusiness extends HomeState {
  final String heroTag;
  final Business business;

  OnAnalyzeBusiness({@required this.business, @required this.heroTag});
  @override
  String toString() => 'OnFCNPage';
}
