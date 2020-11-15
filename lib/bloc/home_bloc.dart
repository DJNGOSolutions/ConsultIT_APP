import 'package:bloc/bloc.dart';
import 'package:consult_it_app/events/home_events.dart';
import 'package:consult_it_app/repositories/user_repository.dart';
import 'package:consult_it_app/states/home_states.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeState initialState, {UserRepository userRepository})
      : super(initialState);

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is ToAddBusinessPage) {
      //TODO: Ir a pantalla de agregar comercio
      yield OnAddBusinessPage();
    } else if (event is ToHomePage) {
      yield OnHomePage();
    } else if (event is AddNewBusiness) {
      //TODO: Agregar comercio al servidor
      yield OnHomePage();
    } else if (event is ToMyBusinessesList) {
      //TODO: Agregar peticion para obtener todos los negocios
      yield OnMyBussinessesList();
    } else if (event is ToMyBusinessDetailsPage) {
      //TODO: Agregar peticion para obtener detalles de una emprresa
      yield OnMyBusinessDetails();
    } else if (event is ToEditBusinessPage) {
      //TODO: Agregar estado para pantalla donde se edita la informacion del negocio
      yield OnHomePage();
    } else if (event is ToConsultantsListPage) {
      //TODO: Agregar peticion para obtener a todos los consultores
      yield OnConsultantsList();
    } else if (event is ToConsultantDetailsPage) {
      //TODO: Agregar navegacion al perfil del consultor
      yield OnConsultantsProfilePage();
    } else if (event is ToWebView) {
      yield OnWebBrowser();
    } else if (event is ToProfilePage) {
      yield OnProfilePage();
    } else if (event is ToEditProfilePage) {
      yield OnEditProfilePage();
    } else if (event is SaveNewProfileInfo) {
      yield OnHomePage();
    } else if (event is ToFAQBotPage) {
      yield OnFAQBotPage();
    }
    throw UnimplementedError();
  }
}
