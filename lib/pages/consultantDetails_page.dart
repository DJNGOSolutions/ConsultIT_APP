import 'package:consult_it_app/bloc/home_bloc.dart';
import 'package:consult_it_app/events/home_events.dart';
import 'package:consult_it_app/models/consultant_model.dart';
import 'package:consult_it_app/utils/styles.dart';
import 'package:consult_it_app/utils/widgets_lib.dart' as myWidgets;
import 'package:flutter/material.dart';

class ConsultantDetailsPage extends StatelessWidget {
  final String heroTag, imgPath;
  final Consultant consultant;
  final HomeBloc homeBloc;
  final bool hasPhoto;
  const ConsultantDetailsPage(
      {Key key,
      @required this.heroTag,
      @required this.imgPath,
      @required this.consultant,
      @required this.homeBloc,
      @required this.hasPhoto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myWidgets.customAppBar(
            canGoBack: true,
            context: context,
            function: () => homeBloc.add(ToConsultantsListPage())),
        body: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 10),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Hero(
                tag: heroTag,
                child: Container(
                  margin: EdgeInsets.only(top: 20.0, bottom: 10.0),
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(250),
                    boxShadow: [
                      BoxShadow(
                          color: MyColors.mainColor.withOpacity(0.14),
                          blurRadius: 50.0,
                          offset: Offset(0, 0))
                    ],
                    image: DecorationImage(
                        image: hasPhoto
                            ? NetworkImage(imgPath)
                            : AssetImage(imgPath),
                        fit: BoxFit.contain),
                  ),
                ),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      Center(
                        child: Text(
                          'Informacion general'.toUpperCase(),
                          style: Styles.subHeaderTextStyle
                              .apply(color: MyColors.mainColor),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text('Nombre Completo'.toUpperCase(),
                            style: Styles.bodyTextStyle),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, top: 4.0, bottom: 4.0),
                        child: Text(
                            consultant.firstname + ' ' + consultant.lastName,
                            style: Styles.bodyTextStyle
                                .apply(color: MyColors.secondaryColor)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text('Titulo profesional'.toUpperCase(),
                            style: Styles.bodyTextStyle),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, top: 4.0, bottom: 4.0),
                        child: Text(
                            myWidgets.isNotEmptyOrNull(consultant.deegre)
                                ? consultant.deegre
                                : 'Asesor Económico',
                            style: Styles.bodyTextStyle
                                .apply(color: MyColors.secondaryColor)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text('Departamento'.toUpperCase(),
                            style: Styles.bodyTextStyle),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, top: 4.0, bottom: 4.0),
                        child: Text(consultant.state,
                            style: Styles.bodyTextStyle
                                .apply(color: MyColors.secondaryColor)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text('Fecha de nacimiento'.toUpperCase(),
                            style: Styles.bodyTextStyle),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, top: 4.0, bottom: 4.0),
                        child: Text(consultant.birthdate,
                            style: Styles.bodyTextStyle
                                .apply(color: MyColors.secondaryColor)),
                      ),
                      SizedBox(
                        height: 13.0,
                      )
                    ]),
              ),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      Center(
                        child: Text(
                          'Informacion de consultoria'.toUpperCase(),
                          style: Styles.subHeaderTextStyle
                              .apply(color: MyColors.mainColor),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text('Precio de referencia'.toUpperCase(),
                            style: Styles.bodyTextStyle),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, top: 4.0, bottom: 4.0),
                        child: Text(
                            '\$ ${consultant.referencePrice.toString()}',
                            style: Styles.bodyTextStyle
                                .apply(color: MyColors.secondaryColor)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text('Rating promedio'.toUpperCase(),
                            style: Styles.bodyTextStyle),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, top: 4.0, bottom: 4.0),
                        child: Text(consultant.averageRating.toString(),
                            style: Styles.bodyTextStyle
                                .apply(color: MyColors.secondaryColor)),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Row(
                            children: [
                              Text('Linea de negocio'.toUpperCase(),
                                  style: Styles.bodyTextStyle),
                              SizedBox(
                                width: 4.0,
                              ),
                              Icon(
                                Icons.info_outlined,
                                size: 18,
                              )
                            ],
                          )),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, top: 4.0, bottom: 4.0),
                        child: Text(
                            myWidgets
                                    .isNotEmptyOrNull(consultant.consultantType)
                                ? consultant.consultantType
                                : 'Financiero',
                            style: Styles.bodyTextStyle
                                .apply(color: MyColors.secondaryColor)),
                      ),
                      SizedBox(
                        height: 13.0,
                      )
                    ]),
              ),
              SizedBox(
                height: 25.0,
              ),
              consultant.user != null
                  ? Container(
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 20.0),
                            Center(
                              child: Text(
                                'Informacion de contacto'.toUpperCase(),
                                style: Styles.subHeaderTextStyle
                                    .apply(color: MyColors.mainColor),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Row(
                                  children: [
                                    Text('Numero de telefono'.toUpperCase(),
                                        style: Styles.bodyTextStyle),
                                    SizedBox(
                                      width: 4.0,
                                    ),
                                    Icon(
                                      Icons.phone,
                                      size: 18,
                                    )
                                  ],
                                )),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 12.0, top: 4.0, bottom: 4.0),
                              child: Text(
                                  myWidgets.isNotEmptyOrNull(
                                          consultant.phoneNumber)
                                      ? consultant.phoneNumber
                                      : '',
                                  style: Styles.bodyTextStyle
                                      .apply(color: MyColors.secondaryColor)),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Row(
                                children: [
                                  Text('Correo'.toUpperCase(),
                                      style: Styles.bodyTextStyle),
                                  SizedBox(
                                    width: 4.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 4.0),
                                    child: Icon(
                                      Icons.email_rounded,
                                      size: 18,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 12.0, top: 4.0, bottom: 4.0),
                              child: Text(
                                  myWidgets.isNotEmptyOrNull(
                                          consultant.user.email)
                                      ? consultant.user?.email
                                      : '',
                                  style: Styles.bodyTextStyle
                                      .apply(color: MyColors.secondaryColor)),
                            ),
                            SizedBox(
                              height: 13.0,
                            )
                          ]),
                    )
                  : SizedBox(),
              SizedBox(height: 30.0),
              Column(
                children: [
                  myWidgets.customButton(
                      maxWidth: MediaQuery.of(context).size.width * 0.44,
                      context: context,
                      labelText: 'Contactar Asesor',
                      function: null),
                  SizedBox(
                    height: 13.0,
                  ),
                  myWidgets.customButton(
                      maxWidth: MediaQuery.of(context).size.width * 0.74,
                      context: context,
                      function: null,
                      labelText: 'Enviar mi informacion de contacto',
                      isMain: false),
                  SizedBox(
                    height: 13.0,
                  ),
                  myWidgets.customButton(
                      maxWidth: MediaQuery.of(context).size.width * 0.44,
                      context: context,
                      function: null,
                      labelText: 'Evaluar asesor',
                      isMain: false,
                      isAccent: true),
                ],
              ),
              SizedBox(
                height: 30.0,
              )
            ],
          ),
        ));
  }
}
