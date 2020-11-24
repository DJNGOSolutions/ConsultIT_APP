import 'package:consult_it_app/bloc/home_bloc.dart';
import 'package:consult_it_app/models/business_model.dart';
import 'package:consult_it_app/models/consultant_model.dart';
import 'package:consult_it_app/states/home_states.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class HomeEvent extends Equatable {}

class ToHomePage extends HomeEvent {
  @override
  String toString() => 'ToHomePage';
}

class ToMyBusinessesList extends HomeEvent {
  @override
  String toString() => 'ToMyBusinessesList';
}

class ToMyBusinessDetailsPage extends HomeEvent {
  final Business business;

  ToMyBusinessDetailsPage({@required this.business});
  @override
  String toString() => 'ToMyBusinessDetailsPage';
}

class ToAddBusinessPage extends HomeEvent {
  @override
  String toString() => 'ToAddBusinessPage';
}

class AddNewBusiness extends HomeEvent {
  final String nombreLegal,
      nombreComercial,
      direccion,
      departamento,
      municipio,
      giro,
      sector,
      correo,
      codPostal,
      telefono;

  AddNewBusiness(
      {@required this.nombreLegal,
      @required this.nombreComercial,
      @required this.direccion,
      @required this.departamento,
      @required this.municipio,
      @required this.giro,
      @required this.sector,
      @required this.correo,
      @required this.codPostal,
      @required this.telefono});
  @override
  String toString() => 'AddNewBusiness';
}

class ToEditBusinessPage extends HomeEvent {
  final Business business;

  ToEditBusinessPage({@required this.business});
  @override
  String toString() => 'ToEditBusinessPage';
}

class ToConsultantsListPage extends HomeEvent {
  @override
  String toString() => 'ToConsultantsListPage';
}

class ToConsultantDetailsPage extends HomeEvent {
  final Consultant consultant;

  ToConsultantDetailsPage({@required this.consultant});

  @override
  String toString() => 'ToConsultantsListPage';
}

class ToWebView extends HomeEvent {
  final HomeState nextState;
  final String query;

  ToWebView({@required this.query, @required this.nextState});
  @override
  String toString() => 'ToWebView';
}

class ToEditProfilePage extends HomeEvent {
  @override
  String toString() => 'ToEditProfilePage';
}

class ToProfilePage extends HomeEvent {
  @override
  String toString() => 'ToProfilePage';
}

class SaveNewProfileInfo extends HomeEvent {
  final String firstName,
      lastName,
      phoneNumber,
      state,
      city,
      degree,
      consultantType,
      referencePrice;
  final bool isEntrepreneur;

  SaveNewProfileInfo({
    @required this.firstName,
    @required this.lastName,
    @required this.phoneNumber,
    this.degree,
    this.referencePrice,
    this.consultantType,
    @required this.state,
    @required this.isEntrepreneur,
    @required this.city,
  });
  @override
  String toString() => 'SaveNewProfileInfo';
}

class SaveNewBusinessInfo extends HomeEvent {
  @override
  String toString() => 'SaveNewBusinessInfo';

  final String comercialName,
      email,
      phoneNumber,
      address,
      postalAddress,
      state,
      city,
      businessLine,
      businessSector;
  final Business business;

  SaveNewBusinessInfo(
      {@required this.comercialName,
      @required this.email,
      @required this.business,
      @required this.phoneNumber,
      @required this.address,
      @required this.postalAddress,
      @required this.state,
      @required this.city,
      @required this.businessLine,
      @required this.businessSector});
}

class DeleteBusiness extends HomeEvent {
  final Business business;

  DeleteBusiness({@required this.business});
  @override
  String toString() => 'DeleteBusiness';
}

class ToFAQBotPage extends HomeEvent {
  @override
  String toString() => 'ToFAQBotPage';
}

class ToAnalizeMarketPage extends HomeEvent {
  @override
  String toString() => 'ToAnalizeMarketPage';
}

class BottomBarPressed extends HomeEvent {
  final int currentIndex;

  BottomBarPressed(this.currentIndex);
  @override
  String toString() => 'BottomBarPressed';
}
