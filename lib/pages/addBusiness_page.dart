import 'package:consult_it_app/bloc/home_bloc.dart';
import 'package:consult_it_app/events/home_events.dart';
import 'package:consult_it_app/utils/styles.dart';
import 'package:flutter/material.dart';
import '../utils/widgets_lib.dart' as myWidgets;

class AddBusinessPage extends StatefulWidget {
  final HomeBloc homeBloc;

  const AddBusinessPage({Key key, @required this.homeBloc}) : super(key: key);
  @override
  _AddBusinessPageState createState() => _AddBusinessPageState();
}

class _AddBusinessPageState extends State<AddBusinessPage> {
  HomeBloc get homeBloc => widget.homeBloc;
  TextEditingController _nombreLegalController = TextEditingController(),
      _nombreComercialController = TextEditingController(),
      _direccionController = TextEditingController(),
      _departamentoController = TextEditingController(),
      _municipioController = TextEditingController(),
      _giroController = TextEditingController(),
      _sectorController = TextEditingController(),
      _correoController = TextEditingController(),
      _telController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: myWidgets.customAppBar(
                context: context,
                canGoBack: true,
                function: () => homeBloc.add(ToHomePage())),
            body: ListView(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.only(top: 12.0, right: 0.0, left: 20.0),
                  child: Row(
                    children: [
                      Flexible(
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/icons/Upgrade.png'))),
                        ),
                        flex: 2,
                        fit: FlexFit.loose,
                      ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Agregar Comercio',
                            style: Styles.headerTextStyle,
                          ),
                        ),
                        flex: 7,
                        fit: FlexFit.tight,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Center(
                    child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Ingrese toda la informacion solicitada a continuacion sobre su comercio o empresa, esta informacion sera utilizada para crear un perfil de su empresa dentro del sistema.\n\nLa informacion registrada dentro del sistema no será compartida con ninguna fuente externa a ConsultIT sin su previo consentimiento.',
                    style: Styles.bodyTextStyleNonBold,
                  ),
                )),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(143, 148, 251, .2),
                            blurRadius: 20.0,
                            offset: Offset(0, 10))
                      ]),
                  child: Column(
                    children: [
                      // Nombre segun documento de identidad
                      myWidgets.inputField(_nombreLegalController,
                          hintText: '',
                          labelText: 'Nombre legal de la empresa',
                          icon: Icons.business,
                          uppercase: false,
                          bold: false),
                      // Nombre segun documento de identidad
                      myWidgets.inputField(_nombreComercialController,
                          hintText: '',
                          labelText: 'Nombre Comercial de la empresa',
                          icon: Icons.business,
                          uppercase: false,
                          bold: false),
                      // Nombre segun documento de identidad
                      myWidgets.inputField(_direccionController,
                          hintText: '',
                          labelText: 'Direccion de la empresa',
                          icon: Icons.map,
                          uppercase: false,
                          bold: false),
                      // Nombre segun documento de identidad
                      myWidgets.inputField(_departamentoController,
                          hintText: '',
                          labelText: 'Departamento de la empresa',
                          icon: Icons.location_on,
                          uppercase: false,
                          bold: false),
                      // Nombre segun documento de identidad
                      myWidgets.inputField(_municipioController,
                          hintText: '',
                          labelText: 'Municipio de la empresa',
                          icon: Icons.location_on,
                          uppercase: false,
                          bold: false),
                      // Nombre segun documento de identidad
                      myWidgets.inputField(_giroController,
                          hintText: '',
                          labelText: 'Giro de la empresa',
                          icon: Icons.monetization_on,
                          uppercase: false,
                          bold: false),
                      // Nombre segun documento de identidad
                      myWidgets.inputField(_sectorController,
                          hintText: '',
                          labelText: 'Sector de la empresa',
                          icon: Icons.attach_money,
                          uppercase: false,
                          bold: false),
                      // Nombre segun documento de identidad
                      myWidgets.inputField(_correoController,
                          hintText: '',
                          labelText: 'Correo de la empresa',
                          icon: Icons.email,
                          uppercase: false,
                          bold: false),
                      // Nombre segun documento de identidad
                      myWidgets.inputField(_telController,
                          hintText: '',
                          labelText: 'Numero telefonico de la empresa',
                          icon: Icons.phone,
                          uppercase: false,
                          bold: false),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: myWidgets.customButton(
                      context: context,
                      labelText: "Agregar",
                      function: () => homeBloc.add(AddNewBusiness(
                          correo: _correoController.text,
                          departamento: _departamentoController.text,
                          direccion: _direccionController.text,
                          giro: _giroController.text,
                          municipio: _municipioController.text,
                          nombreComercial: _nombreComercialController.text,
                          nombreLegal: _nombreLegalController.text,
                          sector: _sectorController.text,
                          telefono: _telController.text))),
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            )));
  }
}
