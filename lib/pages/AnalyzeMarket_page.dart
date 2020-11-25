import 'package:consult_it_app/bloc/home_bloc.dart';
import 'package:consult_it_app/events/home_events.dart';
import 'package:consult_it_app/states/home_states.dart';
import 'package:consult_it_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:consult_it_app/utils/widgets_lib.dart' as myWidgets;
import 'package:fluttertoast/fluttertoast.dart';

class AnalizeMarketPage extends StatefulWidget {
  final HomeBloc homeBloc;
  final String heroTag, optionName;

  const AnalizeMarketPage(
      {Key key,
      @required this.homeBloc,
      @required this.heroTag,
      @required this.optionName})
      : super(key: key);

  @override
  _AnalizeMarketPageState createState() => _AnalizeMarketPageState();
}

class _AnalizeMarketPageState extends State<AnalizeMarketPage> {
  HomeBloc get homeBloc => widget.homeBloc;
  TextEditingController _businessSectorController = TextEditingController(),
      __cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myWidgets.customAppBar(
          context: context,
          function: () => homeBloc.add(ToHomePage()),
          canGoBack: true),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              children: <Widget>[
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: Hero(
                        tag: widget.heroTag,
                        child: Container(
                          height: 50.0,
                          width: 50.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/icons/MarketFluctuation.png'),
                                fit: BoxFit.contain),
                          ),
                        ),
                      ),
                      flex: 2,
                      fit: FlexFit.tight,
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Text(widget.optionName.toUpperCase(),
                            style: Styles.headerTextStyle),
                      ),
                      flex: 9,
                      fit: FlexFit.tight,
                    )
                  ],
                ),
                SizedBox(height: 15.0),
                Text(
                  'Antes de comenzar un nuevo negocio es muy importante que conozcas la situacion del mercado actual para el sector del mercado correspondiente. \n\nEsto te ayudara a determinar el posible crecimiento de tu empresa, la posible demanda a tu producto, como asi tambien te ayudara a determinar la competencia del mercado para ese sector en especifico.\n\nUna Manera de comenzar con este analisis es investigar como se encuentra la situacion del mercado correspondiente para tu negocio dentro de tu pais de residencia. \n\nNosotros te ayudamos a realizar este primer paso, lo unico que debes hacer es ingresar los campos solicitados a continuacion',
                  style:
                      Styles.bodyTextStyleNonBold.apply(fontSizeFactor: 0.96),
                ),
                SizedBox(
                  height: 15.0,
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Icon(Icons.info_outline,
                                      size: 28,
                                      color: Color.fromRGBO(3, 90, 166, 1)),
                                ),
                              ),
                              Flexible(
                                fit: FlexFit.loose,
                                flex: 6,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    'INFORMACION DE MERCADO',
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
                        myWidgets.inputField(_businessSectorController,
                            hintText: 'Sector de negocio de interes',
                            labelText: 'Sector de negocio',
                            icon: Icons.work,
                            uppercase: false,
                            bold: false),
                        // Apellidos segun documento de identidad
                        myWidgets.inputField(__cityController,
                            hintText: 'Pais de interes',
                            labelText: 'Pais de interes',
                            icon: Icons.map,
                            uppercase: false,
                            bold: false),
                      ],
                    )),
                SizedBox(
                  height: 18.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.0),
                  child: myWidgets.customButton(
                      labelText: 'Analizar Mercado',
                      maxWidth: 65,
                      context: context,
                      function: () => verifyInfo(_businessSectorController.text,
                          __cityController.text)),
                ),
                SizedBox(
                  height: 40.0,
                ),
              ])),
    );
  }

  verifyInfo(String sector, city) {
    myWidgets.isNotEmptyOrNull(sector)
        ? myWidgets.isNotEmptyOrNull(city)
            ? homeBloc.add(ToWebView(
                city: __cityController.text,
                sector: _businessSectorController.text,
                nextState: OnAnalizeMarket()))
            : Fluttertoast.showToast(
                msg:
                    'Por favor ingrese la ciudad en la que desea analizar el mercado',
                backgroundColor: Colors.red)
        : Fluttertoast.showToast(
            msg: 'Por favor ingrese el mercado que desea analizar el mercado',
            backgroundColor: Colors.red);
  }
}
