import 'package:consult_it_app/bloc/home_bloc.dart';
import 'package:consult_it_app/events/home_events.dart';
import 'package:consult_it_app/models/consultant_model.dart';
import 'package:consult_it_app/models/entrepreneur_model.dart';
import 'package:consult_it_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:consult_it_app/utils/widgets_lib.dart' as myWidgets;

class EditProfilePage extends StatelessWidget {
  final Consultant consultant;
  final Entrepreneur entrepreneur;
  final String heroTag;
  final HomeBloc homeBloc;

  const EditProfilePage(
      {Key key,
      this.consultant,
      this.entrepreneur,
      @required this.heroTag,
      @required this.homeBloc})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myWidgets.customAppBar(
          context: context,
          canGoBack: true,
          function: () => homeBloc.add(ToProfilePage())),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
            padding: EdgeInsets.only(left: 25.0, right: 25.0),
            children: <Widget>[
              SizedBox(height: 10.0),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Hero(
                      tag: heroTag,
                      child: Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/icons/Edit.png'),
                              fit: BoxFit.contain),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child:
                          Text('Editar perfil', style: Styles.headerTextStyle),
                    ),
                  ]),
              SizedBox(
                height: 25.0,
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
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
                      Row(
                        children: [
                          Flexible(
                            fit: FlexFit.loose,
                            flex: 2,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Icon(Icons.person,
                                  size: 28,
                                  color: Color.fromRGBO(3, 90, 166, 1)),
                            ),
                          ),
                          Flexible(
                            fit: FlexFit.loose,
                            flex: 6,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                'INFORMACION PERSONALES',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: Fonts.primaryFont,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Nombre segun documento de identidad
                      myWidgets.inputField(
                          hintText: 'Ingrese su(s) nombre(s)',
                          labelText: 'Nombre(s)',
                          icon: Icons.person_outline,
                          uppercase: false,
                          bold: false),
                      // Apellidos segun documento de identidad
                      myWidgets.inputField(
                          hintText: 'Ingrese su(s) apellido(s)',
                          labelText: 'Apellido(s)',
                          icon: Icons.person_outline,
                          uppercase: false,
                          bold: false),
                    ],
                  )),
              SizedBox(
                height: 15.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8.0),
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
                    Row(
                      children: [
                        Flexible(
                          fit: FlexFit.loose,
                          flex: 2,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(Icons.supervised_user_circle,
                                size: 28, color: Color.fromRGBO(3, 90, 166, 1)),
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.loose,
                          flex: 6,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'INFORMACION DE CONTACTO',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: Fonts.primaryFont,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Correo Electronico
                    myWidgets.inputField(
                        hintText: 'Ingrese su correo',
                        labelText: 'Correo electrónico',
                        icon: Icons.email,
                        uppercase: false,
                        bold: false),
                    // Telefono de contacto
                    myWidgets.inputField(
                        hintText: 'Ingrese su telefono de contacto',
                        labelText: 'Telefono de contacto',
                        icon: Icons.phone,
                        uppercase: false,
                        bold: false), // Pais de residencia
                    myWidgets.inputField(
                        hintText: 'Ingrese su departamento de residencía',
                        labelText: 'Departamento',
                        icon: Icons.location_on,
                        uppercase: false,
                        bold: false),
                    // Ciudad de residencia
                    myWidgets.inputField(
                      hintText: 'Ingrese su municipio de residencía',
                      labelText: 'Municipio',
                      icon: Icons.location_city,
                      uppercase: false,
                      bold: false,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              // Fin de datos de usuario
              Container(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 60.0),
                child: myWidgets.customButton(
                    context: context,
                    labelText: 'Guardar',
                    function: () => homeBloc.add(SaveNewProfileInfo()),
                    maxWidth: 65),
              ),
            ]),
      ),
    );
  }
}
