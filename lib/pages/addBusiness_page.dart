import 'package:consult_it_app/utils/styles.dart';
import 'package:flutter/material.dart';
import '../utils/widgets_lib.dart' as myWidgets;

class AddBusinessPage extends StatefulWidget {
  @override
  _AddBusinessPageState createState() => _AddBusinessPageState();
}

class _AddBusinessPageState extends State<AddBusinessPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: myWidgets.customAppBar(context: context, canGoBack: true),
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
                      myWidgets.inputField(
                          hintText: '',
                          labelText: 'Nombre legal de la empresa',
                          icon: Icons.business,
                          uppercase: false,
                          bold: false),
                      // Nombre segun documento de identidad
                      myWidgets.inputField(
                          hintText: '',
                          labelText: 'Nombre Comercial de la empresa',
                          icon: Icons.business,
                          uppercase: false,
                          bold: false),
                      // Nombre segun documento de identidad
                      myWidgets.inputField(
                          hintText: '',
                          labelText: 'Direccion de la empresa',
                          icon: Icons.map,
                          uppercase: false,
                          bold: false),
                      // Nombre segun documento de identidad
                      myWidgets.inputField(
                          hintText: '',
                          labelText: 'Departamento de la empresa',
                          icon: Icons.location_on,
                          uppercase: false,
                          bold: false),
                      // Nombre segun documento de identidad
                      myWidgets.inputField(
                          hintText: '',
                          labelText: 'Municipio de la empresa',
                          icon: Icons.location_on,
                          uppercase: false,
                          bold: false),
                      // Nombre segun documento de identidad
                      myWidgets.inputField(
                          hintText: '',
                          labelText: 'Giro de la empresa',
                          icon: Icons.monetization_on,
                          uppercase: false,
                          bold: false),
                      // Nombre segun documento de identidad
                      myWidgets.inputField(
                          hintText: '',
                          labelText: 'Sector de la empresa',
                          icon: Icons.attach_money,
                          uppercase: false,
                          bold: false),
                      // Nombre segun documento de identidad
                      myWidgets.inputField(
                          hintText: '',
                          labelText: 'Correo de la empresa',
                          icon: Icons.email,
                          uppercase: false,
                          bold: false),
                      // Nombre segun documento de identidad
                      myWidgets.inputField(
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
                      context: context, labelText: "Agregar", route: null),
                )
              ],
            )));
  }
}
