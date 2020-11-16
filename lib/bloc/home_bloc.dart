import 'package:bloc/bloc.dart';
import 'package:consult_it_app/events/authentication_events.dart';
import 'package:consult_it_app/events/home_events.dart';
import 'package:consult_it_app/repositories/user_repository.dart';
import 'package:consult_it_app/states/home_states.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeState initialState, {UserRepository userRepository})
      : super(initialState);

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is ToAddBusinessPage) {
      //TODO: Ir a pantalla de agregar comercio
      yield OnAddBusinessPage();
    } else if (event is ToHomePage) {
      yield OnHomePage(0);
    } else if (event is AddNewBusiness) {
      //TODO: Agregar comercio al servidor
      print(
          'Nombre Legal: ${event.nombreLegal} \nNombre Comercial: ${event.nombreComercial} \nDireccion: ${event.direccion} \nMunicipio: ${event.municipio} \nGiro: ${event.giro} \nSector: ${event.sector} \nCorreo: ${event.correo} \nTelefono: ${event.telefono}');
      yield OnHomePage(0);
    } else if (event is ToMyBusinessesList) {
      //TODO: Agregar peticion para obtener todos los negocios
      yield OnMyBussinessesList();
    } else if (event is ToMyBusinessDetailsPage) {
      //TODO: Agregar peticion para obtener detalles de una emprresa
      yield OnMyBusinessDetails();
    } else if (event is ToEditBusinessPage) {
      //TODO: Agregar estado para pantalla donde se edita la informacion del negocio
      yield OnHomePage(0);
    } else if (event is ToConsultantsListPage) {
      //TODO: Agregar peticion para obtener a todos los consultores
      yield OnConsultantsList();
    } else if (event is ToConsultantDetailsPage) {
      //TODO: Agregar navegacion al perfil del consultor
      yield OnConsultantsProfilePage();
    } else if (event is ToWebView) {
      _launchUrl(query: event.query);
      yield OnWebBrowser();
    } else if (event is ToProfilePage) {
      yield OnProfilePage();
    } else if (event is ToEditProfilePage) {
      yield OnEditProfilePage();
    } else if (event is SaveNewProfileInfo) {
      yield OnHomePage(0);
    } else if (event is ToFAQBotPage) {
      yield OnFAQBotPage();
    } else if (event is ToAnalizeMarketPage) {
      yield OnAnalizeMarket();
    } else if (event is BottomBarPressed) {
      yield ChangeHomeContainer(event.currentIndex);
      yield OnHomePage(event.currentIndex);
    } else if (event is RegisterConsultant) {
      //TODO: Register Consultant to server
      yield OnHomePage(0);
    } else if (event is RegisterEntrepreneur) {
      //TODO: Register Entrepreneur to server
      yield OnHomePage(0);
    } else {
      throw UnimplementedError();
    }
  }

  Future<void> _launchUrl({@required String query}) async {
    String url = 'https://www.google.com/search?q=';
    String finalUrl =
        'oportunidad de mercado para empresas de ' + query + ' en El Salvador';
    finalUrl = finalUrl.replaceAll(" ", '+');
    url = url + finalUrl;
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }
}
