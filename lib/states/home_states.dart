import 'package:equatable/equatable.dart';

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
  @override
  String toString() => 'MyBussinessesList';
}

class OnMyBusinessDetails extends HomeState {
  @override
  String toString() => 'MyBusinessDetails';
}

class OnWebBrowser extends HomeState {
  @override
  String toString() => 'OnWebBrowser';
}

class OnConsultantsList extends HomeState {
  @override
  String toString() => 'ConsultantsList';
}

class OnConsultantsProfilePage extends HomeState {
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
