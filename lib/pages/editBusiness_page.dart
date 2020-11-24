import 'package:consult_it_app/bloc/home_bloc.dart';
import 'package:consult_it_app/events/home_events.dart';
import 'package:consult_it_app/models/business_model.dart';
import 'package:consult_it_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:consult_it_app/utils/widgets_lib.dart' as myWidgets;

class EditBusinessPage extends StatefulWidget {
  final HomeBloc homeBloc;
  final Business business;
  final String heroTag;

  const EditBusinessPage(
      {Key key,
      @required this.homeBloc,
      @required this.business,
      @required this.heroTag})
      : super(key: key);
  @override
  _EditBusinessPageState createState() => _EditBusinessPageState();
}

class _EditBusinessPageState extends State<EditBusinessPage> {
  HomeBloc get homeBloc => widget.homeBloc;
  Business get business => widget.business;

  TextEditingController _legalNameController = TextEditingController(),
      _comercialNameController = TextEditingController(),
      _emailController = TextEditingController(),
      _phoneNumberController = TextEditingController(),
      _addressController = TextEditingController(),
      _postalAddressController = TextEditingController(),
      _stateController = TextEditingController(),
      _cityController = TextEditingController(),
      _businessLineController = TextEditingController(),
      _businessSectorController = TextEditingController();

  @override
  void initState() {
    if (myWidgets.isNotEmptyOrNull(business.legalName)) {
      _legalNameController.text = business.legalName;
    }
    if (myWidgets.isNotEmptyOrNull(business.comercialName)) {
      _comercialNameController.text = business.comercialName;
    }
    if (myWidgets.isNotEmptyOrNull(business.businessLine)) {
      _businessLineController.text = business.businessLine;
    }
    if (myWidgets.isNotEmptyOrNull(business.businessSector)) {
      _businessSectorController.text = business.businessSector;
    }
    if (myWidgets.isNotEmptyOrNull(business.phoneNumber)) {
      _phoneNumberController.text = business.phoneNumber;
    }
    if (myWidgets.isNotEmptyOrNull(business.email)) {
      _emailController.text = business.email;
    }
    if (myWidgets.isNotEmptyOrNull(business.city)) {
      _cityController.text = business.city;
    }
    if (myWidgets.isNotEmptyOrNull(business.state)) {
      _stateController.text = business.state;
    }
    if (myWidgets.isNotEmptyOrNull(business.address)) {
      _addressController.text = business.address;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myWidgets.customAppBar(
          context: context,
          canGoBack: true,
          function: () =>
              widget.homeBloc.add(ToMyBusinessDetailsPage(business: business))),
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
                      tag: widget.heroTag,
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
                      child: Text('Editar Comercio',
                          style: Styles.headerTextStyle),
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
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: [
                            Flexible(
                              fit: FlexFit.loose,
                              flex: 2,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Icon(Icons.location_city,
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
                                  'INFORMACION DE COMERCIO',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: Fonts.primaryFont,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Nombre segun documento de identidad
                      myWidgets.inputField(_legalNameController,
                          hintText: 'Nombre legal',
                          labelText: 'Nombre legal',
                          icon: Icons.keyboard,
                          uppercase: false,
                          enabled: false,
                          bold: false),
                      // Apellidos segun documento de identidad
                      myWidgets.inputField(_comercialNameController,
                          hintText: 'Nombre comercial',
                          labelText: 'Nombre comercial',
                          icon: Icons.keyboard,
                          uppercase: false,
                          bold: false),
                      // Nombre segun documento de identidad
                      myWidgets.inputField(_businessLineController,
                          hintText: 'Linea de negocio',
                          labelText: 'Linea de negocio',
                          icon: Icons.business,
                          uppercase: false,
                          bold: false),
                      // Apellidos segun documento de identidad
                      myWidgets.inputField(_businessSectorController,
                          hintText: 'Sector de negocio',
                          labelText: 'Sector de negocio',
                          icon: Icons.business_center_outlined,
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
                    // Telefono de contacto de la empresa
                    myWidgets.inputField(_phoneNumberController,
                        hintText: 'Ingrese el telefono de contacto',
                        labelText: 'Telefono de contacto',
                        icon: Icons.phone,
                        uppercase: false,
                        bold: false),
                    // Correo electronico de la empresa
                    myWidgets.inputField(_emailController,
                        hintText: 'Correo de contacto',
                        labelText: 'Correo electronico',
                        icon: Icons.email_outlined,
                        uppercase: false,
                        bold: false),
                    // Direccion de la empresa
                    myWidgets.inputField(_addressController,
                        hintText: 'Direccion de la empresa',
                        labelText: 'Direccion',
                        icon: Icons.map_outlined,
                        uppercase: false,
                        bold: false),
                    // Departamento de la empresa
                    myWidgets.inputField(_stateController,
                        hintText: 'Departamento de la empresa',
                        labelText: 'Departamento',
                        icon: Icons.location_on,
                        uppercase: false,
                        bold: false),
                    // Municipio de la empresa
                    myWidgets.inputField(_cityController,
                        hintText: 'Municipio de la empresa',
                        labelText: 'Municipio',
                        icon: Icons.location_on,
                        uppercase: false,
                        bold: false),
                  ],
                ),
              ),
              SizedBox(height: 15.0),
              // Fin de datos de usuario
              Container(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 60.0),
                child: myWidgets.customButton(
                    context: context,
                    labelText: 'Guardar',
                    function: () => homeBloc.add(SaveNewBusinessInfo(
                        business: business,
                        comercialName: _comercialNameController.text,
                        email: _emailController.text,
                        phoneNumber: _phoneNumberController.text,
                        address: _addressController.text,
                        postalAddress: _postalAddressController.text,
                        state: _stateController.text,
                        city: _cityController.text,
                        businessLine: _businessLineController.text,
                        businessSector: _businessSectorController.text)),
                    maxWidth: 65),
              ),
            ]),
      ),
    );
  }
}
