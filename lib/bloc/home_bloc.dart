import 'package:bloc/bloc.dart';
import 'package:consult_it_app/events/home_events.dart';
import 'package:consult_it_app/repositories/business_repository.dart';
import 'package:consult_it_app/repositories/consultant_repository.dart';
import 'package:consult_it_app/repositories/entrepreneur_repository.dart';
import 'package:consult_it_app/repositories/user_repository.dart';
import 'package:consult_it_app/states/authentication_states.dart';
import 'package:consult_it_app/states/home_states.dart';
import 'package:consult_it_app/utils/styles.dart';
import 'package:consult_it_app/utils/widgets_lib.dart';
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
    print(event.toString());
    if (event is ToAddBusinessPage) {
      yield OnAddBusinessPage();
    } else if (event is ToHomePage) {
      yield OnHomePage(0);
    } else if (event is AddNewBusiness) {
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
            final businesses = await businessRepository.findAllBusinesses(
                username: _prefs.getString('username'));
            if (businesses != null) {
              entrepreneurRepository.entrepreneur.businesses = businesses;
              Fluttertoast.showToast(
                  msg: 'Comercio agregado con exito',
                  backgroundColor: MyColors.mainColor,
                  textColor: MyColors.accentColor);
            } else {
              Fluttertoast.showToast(
                  toastLength: Toast.LENGTH_LONG,
                  msg:
                      'Error al actualizar tus comercios, inicie sesion nuevamente para observar los cambios',
                  backgroundColor: Colors.red);
            }
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
      yield OnMyBussinessesList(businesses: event.businesses);
    } else if (event is ToMyBusinessDetailsPage) {
      yield OnMyBusinessDetails(business: event.business);
    } else if (event is ToEditBusinessPage) {
      yield OnEditBusinessPage(business: event.business);
    } else if (event is ToConsultantsListPage) {
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
      _launchUrl(sector: event.sector);
      yield event.nextState;
    } else if (event is ToProfilePage) {
      yield OnHomePage(2);
    } else if (event is ToEditProfilePage) {
      yield OnEditProfilePage();
    } else if (event is DeleteBusiness) {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      final response = await businessRepository.deleteBusiness(
          username: _prefs.getString('username'), id: event.business.id);
      if (response != null && response.statusCode == 200) {
        final businesses = await businessRepository.findAllBusinesses(
            username: _prefs.getString('username'));
        if (businesses != null) {
          Fluttertoast.showToast(
              msg: response.message,
              backgroundColor: MyColors.mainColor,
              textColor: MyColors.accentColor);
          yield OnHomePage(0);
        } else {
          Fluttertoast.showToast(
              msg: 'Ocurrio un error al obtener sus comercios',
              backgroundColor: Colors.red);
          yield OnEditBusinessPage(business: event.business);
        }
      } else {
        Fluttertoast.showToast(
            msg:
                'Ocurrio un error al eliminar el comercio, intentelo nuevamente',
            backgroundColor: Colors.red);
        yield OnEditBusinessPage(business: event.business);
      }
    } else if (event is SaveNewBusinessInfo) {
      //Estado para pantalla de carga
      AuthenticationLoading();
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      //Actualizar perfil del negocio
      final response = await businessRepository.updateBusiness(
          id: event.business.id,
          comercialName: event.comercialName,
          email: event.email,
          phoneNumber: event.phoneNumber,
          address: event.address,
          postalAddress: event.postalAddress,
          state: event.state,
          city: event.city,
          businessLine: event.businessLine,
          businessSector: event.businessSector);
      if (response != null) {
        //Si la respuesta es 200 se obtienen todos los comercios para un entrepreneur
        final businesses = await businessRepository.findAllBusinesses(
            username: _prefs.getString('username'));
        if (businesses != null) {
          //Si la lista de businesses es correcta se le asigna al perfil del entrrepreneur
          entrepreneurRepository.entrepreneur.businesses = businesses;
          Fluttertoast.showToast(
              msg: "El comercio se actualizo con exito",
              backgroundColor: MyColors.mainColor,
              textColor: MyColors.accentColor);
          yield OnMyBusinessDetails(business: response);
        } else {
          Fluttertoast.showToast(
              msg:
                  'Error al obtener lista de comercios comercio, intentelo de nuevo.',
              backgroundColor: Colors.red);
          yield OnEditBusinessPage(business: event.business);
        }
      } else {
        Fluttertoast.showToast(
            msg:
                'Error de conexion al actualizar comercio, intentelo de nuevo.',
            backgroundColor: Colors.red);
        yield OnEditBusinessPage(business: event.business);
      }
    } else if (event is SaveNewProfileInfo) {
      AuthenticationLoading();
      if (event.isEntrepreneur) {
        final response = await entrepreneurRepository.updateProfile(
            id: userRepository.user.id,
            firstName: event.firstName,
            lastName: event.lastName,
            photo: '',
            phoneNumber: event.phoneNumber,
            state: event.state,
            city: event.city);
        if (response != null) {
          entrepreneurRepository.entrepreneur.firstName = response.firstName;
          entrepreneurRepository.entrepreneur.lastName = response.lastName;
          entrepreneurRepository.entrepreneur.phoneNumber =
              response.phoneNumber;
          entrepreneurRepository.entrepreneur.state = response.state;
          entrepreneurRepository.entrepreneur.city = response.city;
          Fluttertoast.showToast(
              msg: 'Perfil Actualizado con exito',
              backgroundColor: MyColors.mainColor,
              textColor: MyColors.accentColor);

          yield OnHomePage(2);
        } else {
          Fluttertoast.showToast(
              msg: 'Error de conexion al actualizar el perfil',
              backgroundColor: Colors.red);
        }
      } else {
        final response = await consultantRepository.updateProfile(
            id: userRepository.user.id,
            firstName: event.firstName,
            lastName: event.lastName,
            degree: event.degree,
            referencePrice: event.referencePrice,
            phoneNumber: event.phoneNumber,
            consultantType: event.consultantType,
            state: event.state,
            city: event.city);
        if (response != null) {
          consultantRepository.consultant.firstname = response.firstname;
          consultantRepository.consultant.lastName = response.lastName;
          consultantRepository.consultant.deegre = response.deegre;
          consultantRepository.consultant.referencePrice =
              response.referencePrice;
          consultantRepository.consultant.firstname = response.firstname;
          consultantRepository.consultant.phoneNumber = response.phoneNumber;
          consultantRepository.consultant.consultantType =
              response.consultantType;
          consultantRepository.consultant.state = response.state;
          consultantRepository.consultant.city = response.city;
          Fluttertoast.showToast(
              msg: 'Perfil Actualizado con exito',
              backgroundColor: MyColors.mainColor,
              textColor: MyColors.accentColor);

          yield OnHomePage(2);
        } else {
          Fluttertoast.showToast(
              msg: 'Error de conexion al actualizar el perfil',
              backgroundColor: Colors.red);
        }
      }
    } else if (event is ToFAQBotPage) {
      yield OnFAQBotPage();
    } else if (event is ToAnalizeMarketPage) {
      yield OnAnalizeMarket();
    } else if (event is BottomBarPressed) {
      yield ChangeHomeContainer(event.currentIndex);
      yield OnHomePage(event.currentIndex);
    } else if (event is ToAnalyzeBusinessPage) {
      yield OnAnalyzeBusiness(business: event.business, heroTag: event.heroTag);
    } else {
      throw UnimplementedError();
    }
  }

  Future<void> _launchUrl({@required String sector, String city}) async {
    String googleUrl = 'https://www.google.com/search?q=';
    String search;
    isNotEmptyOrNull(city)
        ? search = 'oportunidad de mercado para empresas del sector ' +
            sector +
            ' en $city'
        : search = 'oportunidad de mercado para empresas de ' +
            sector +
            ' en El Salvador';
    String finalUrl = googleUrl + search.replaceAll(" ", '+');
    if (await canLaunch(finalUrl)) {
      await launch(finalUrl, forceWebView: true, forceSafariVC: true);
    } else {
      throw 'Could not launch $finalUrl';
    }
  }
}
