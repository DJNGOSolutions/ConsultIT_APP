import 'package:consult_it_app/bloc/home_bloc.dart';
import 'package:consult_it_app/events/home_events.dart';
import 'package:consult_it_app/utils/styles.dart';
import 'package:consult_it_app/utils/widgets_lib.dart' as myWidgets;
import 'package:flutter/material.dart';

class BusinessProfilePage extends StatelessWidget {
  final String heroTag, imgPath, businessName;
  final HomeBloc homeBloc;
  const BusinessProfilePage(
      {Key key,
      @required this.heroTag,
      @required this.imgPath,
      @required this.businessName,
      @required this.homeBloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myWidgets.customAppBar(
            canGoBack: true,
            context: context,
            function: () => homeBloc.add(ToHomePage())),
        body: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 10),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Hero(
                tag: heroTag,
                child: Container(
                  margin: EdgeInsets.only(top: 20.0, bottom: 10.0),
                  width: 115,
                  height: 115,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(imgPath), fit: BoxFit.contain),
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
                        child: Text('Nombre legal'.toUpperCase(),
                            style: Styles.bodyTextStyle),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, top: 2.0, bottom: 4.0),
                        child: Text('Variedades unicas'.toUpperCase(),
                            style: Styles.bodyTextStyle
                                .apply(color: MyColors.secondaryColor)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text('Nombre comercial'.toUpperCase(),
                            style: Styles.bodyTextStyle),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, top: 2.0, bottom: 4.0),
                        child: Text(businessName.toUpperCase(),
                            style: Styles.bodyTextStyle
                                .apply(color: MyColors.secondaryColor)),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Row(
                            children: [
                              Text('Sector de mercado'.toUpperCase(),
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
                            left: 12.0, top: 2.0, bottom: 4.0),
                        child: Text('Textiles'.toUpperCase(),
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
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, top: 2.0, bottom: 4.0),
                        child: Text('Venta de ropa online'.toUpperCase(),
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
                            left: 12.0, top: 2.0, bottom: 4.0),
                        child: Text('info@ventatextiles.com'.toUpperCase(),
                            style: Styles.bodyTextStyle
                                .apply(color: MyColors.secondaryColor)),
                      ),
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
                            left: 12.0, top: 2.0, bottom: 4.0),
                        child: Text('2258 9711'.toUpperCase(),
                            style: Styles.bodyTextStyle
                                .apply(color: MyColors.secondaryColor)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Row(
                          children: [
                            Text('Direccion'.toUpperCase(),
                                style: Styles.bodyTextStyle),
                            SizedBox(
                              width: 4.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: Icon(
                                Icons.add_location_alt,
                                size: 18,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, top: 2.0, bottom: 4.0),
                        child: Text(
                            'Edificio abedros, local 12-D'.toUpperCase(),
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
                            left: 12.0, top: 2.0, bottom: 4.0),
                        child: Text('La Libertad'.toUpperCase(),
                            style: Styles.bodyTextStyle
                                .apply(color: MyColors.secondaryColor)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text('Municipio'.toUpperCase(),
                            style: Styles.bodyTextStyle),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, top: 2.0, bottom: 4.0),
                        child: Text('Antiguo Cuscatlan'.toUpperCase(),
                            style: Styles.bodyTextStyle
                                .apply(color: MyColors.secondaryColor)),
                      ),
                      SizedBox(
                        height: 13.0,
                      )
                    ]),
              ),
              SizedBox(height: 30.0),
              Column(
                children: [
                  myWidgets.customButton(
                      context: context,
                      labelText: 'Editar comercio',
                      function: () => homeBloc.add(ToEditBusinessPage())),
                  SizedBox(
                    height: 13.0,
                  ),
                  myWidgets.customButton(
                      maxWidth: MediaQuery.of(context).size.width * 0.73,
                      context: context,
                      function: () => homeBloc.add(ToWebView(
                          query: 'oportunidad de mercado para empresas de ' +
                              'Textiles' +
                              ' en El Salvador')),
                      labelText: 'Consultar situacion del mercado',
                      isMain: false),
                  SizedBox(
                    height: 13.0,
                  ),
                  myWidgets.customButton(
                      maxWidth: MediaQuery.of(context).size.width * 0.54,
                      context: context,
                      function: null,
                      labelText: 'Realizar flujo de caja',
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
