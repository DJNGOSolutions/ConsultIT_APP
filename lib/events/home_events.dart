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
  @override
  String toString() => 'ToMyBusinessDetailsPage';
}

class ToAddBusinessPage extends HomeEvent {
  @override
  String toString() => 'ToAddBusinessPage';
}

class AddNewBusiness extends HomeEvent {
  @override
  String toString() => 'AddNewBusiness';
}

class ToEditBusinessPage extends HomeEvent {
  @override
  String toString() => 'ToEditBusinessPage';
}

class ToConsultantsListPage extends HomeEvent {
  @override
  String toString() => 'ToConsultantsListPage';
}

class ToConsultantDetailsPage extends HomeEvent {
  @override
  String toString() => 'ToConsultantsListPage';
}

class ToWebView extends HomeEvent {
  final String query;

  ToWebView({@required this.query});
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
  @override
  String toString() => 'SaveNewProfileInfo';
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
