import 'package:bloc/bloc.dart';
import 'package:consult_it_app/events/authentication_events.dart';
import 'package:consult_it_app/events/home_events.dart';
import 'package:consult_it_app/models/consultant_model.dart';
import 'package:consult_it_app/repositories/business_repository.dart';
import 'package:consult_it_app/repositories/consultant_repository.dart';
import 'package:consult_it_app/repositories/entrepreneur_repository.dart';
import 'package:consult_it_app/repositories/user_repository.dart';
import 'package:consult_it_app/states/home_states.dart';
import 'package:consult_it_app/utils/network_utils.dart';
import 'package:consult_it_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

const String TAG = "HomeBloc";

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final BusinessRepository businessRepository;
  final UserRepository userRepository;
  final ConsultantRepository consultantRepository;
  final EntrepreneurRepository entrepreneurRepository;

  HomeBloc(HomeState initialState,
      {@required this.businessRepository,
      @required this.userRepository,
      @required this.consultantRepository,
      @required this.entrepreneurRepository})
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

      SharedPreferences _prefs = await SharedPreferences.getInstance();
      String user = _prefs.getString('username');
      print(
          'Username: $user Nombre Legal: ${event.nombreLegal} \nNombre Comercial: ${event.nombreComercial} \nDireccion: ${event.direccion} \nMunicipio: ${event.municipio} \nGiro: ${event.giro} \nSector: ${event.sector} \nCorreo: ${event.correo} \nTelefono: ${event.telefono}');
      final serverResponse = await businessRepository.addNewBusiness(
          username: _prefs.getString('username'),
          legalName: event.nombreLegal,
          comercialName: event.nombreComercial,
          email: event.correo,
          phoneNumber: event.telefono,
          address: event.direccion,
          postalAddress: event.codPostal,
          state: event.departamento,
          city: event.municipio,
          businessLine: event.giro,
          businessSector: event.sector);
      if (serverResponse != null) {
        switch (serverResponse.statusCode) {
          case 200:
            Fluttertoast.showToast(
                msg: 'Comercio agregado con exito',
                backgroundColor: MyColors.mainColor,
                textColor: MyColors.accentColor);
            //TODO: Actualizar businesses para el user
            yield OnHomePage(0);
            break;
          case 400:
            Fluttertoast.showToast(
                msg: 'Sin conexion',
                backgroundColor: MyColors.mainColor,
                textColor: MyColors.accentColor);
            yield OnAddBusinessPage();
            break;
          case 403:
            print(TAG + 'SERVER ERROR: ${serverResponse.statusCode}');
            yield OnAddBusinessPage();
            break;
          case 500:
            Fluttertoast.showToast(
                msg: 'Error interno del servidor, intente mas tarde.',
                backgroundColor: Colors.red);
            yield OnAddBusinessPage();
            break;
          default:
        }
      } else {
        Fluttertoast.showToast(
            msg: 'Error de conexion con el servidor',
            backgroundColor: Colors.red);
        yield OnAddBusinessPage();
      }
    } else if (event is ToMyBusinessesList) {
      //TODO: Agregar peticion para obtener todos los negocios
      yield OnMyBussinessesList();
    } else if (event is ToMyBusinessDetailsPage) {
      yield OnMyBusinessDetails(business: event.business);
    } else if (event is ToEditBusinessPage) {
      //TODO: Agregar estado para pantalla donde se edita la informacion del negocio
      yield OnHomePage(0);
    } else if (event is ToConsultantsListPage) {
      //TODO: Agregar peticion para obtener a todos los consultores
      final serverResponse = await consultantRepository.findAllConsultants();
      if (serverResponse != null) {
        if (serverResponse.length > 0) {
          print('Consultores(${serverResponse.length}) obtenidos con exito');
          yield OnConsultantsList(consultants: serverResponse);
        } else {
          Fluttertoast.showToast(
              msg: 'No se encontraron consultores en este momento.');
        }
      } else {
        Fluttertoast.showToast(
            msg: 'Error de conexion, verifique su conexion a internet',
            backgroundColor: Colors.red);
        yield OnHomePage(0);
      }
    } else if (event is ToConsultantDetailsPage) {
      yield OnConsultantsProfilePage(consultant: event.consultant);
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
      await launch(url, forceWebView: true, forceSafariVC: true);
    } else {
      throw 'Could not launch $url';
    }
  }
}
