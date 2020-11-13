import 'package:consult_it_app/utils/bottom_navigation_bar.dart';
import 'package:consult_it_app/utils/styles.dart';
import 'package:consult_it_app/utils/widgets_lib.dart' as myWidgets;
import 'package:flutter/material.dart';

class BusinessProfilePage extends StatelessWidget {
  final String heroTag, imgPath, businessName;
  const BusinessProfilePage(
      {Key key,
      @required this.heroTag,
      @required this.imgPath,
      @required this.businessName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myWidgets.customAppBar(canGoBack: true, context: context),
        body: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 10),
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
              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    Text(
                      businessName,
                      style: Styles.headerTextStyle.apply(fontSizeFactor: 1.3),
                    ),
                    SizedBox(height: 5.0),
                    Text('Nombre legal del comercio'.toUpperCase(),
                        style: Styles.bodyTextStyle),
                    SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, left: 8.0, right: 8.0, bottom: 2.0),
                      child: Text('Camisas Depormundo',
                          textAlign: TextAlign.center,
                          style: Styles.headerTextStyle
                              .apply(fontSizeFactor: 1.1)),
                    ),
                    Text('Nombre comercial'.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: Styles.bodyTextStyle)
                  ]),
              SizedBox(
                height: 20.0,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0, left: 8.0, right: 8.0, bottom: 2.0),
                              child: Text('Venta de ropa',
                                  style: Styles.headerTextStyle
                                      .apply(fontSizeFactor: 1.1)),
                            ),
                            Text('Linea de negocio'.toUpperCase(),
                                textAlign: TextAlign.center,
                                style: Styles.bodyTextStyle)
                          ]),
                    ),
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0, left: 8.0, right: 8.0, bottom: 2.0),
                              child: FittedBox(
                                child: Text('Textiles',
                                    style: Styles.headerTextStyle.apply(
                                      fontSizeFactor: 1.1,
                                    )),
                              ),
                            ),
                            Text('Sector de negocio'.toUpperCase(),
                                textAlign: TextAlign.center,
                                style: Styles.bodyTextStyle)
                          ]),
                    ),
                  ]),
              SizedBox(height: 20.0),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 8.0, right: 8.0, bottom: 2.0),
                          child:
                              Text('2258 4599', style: Styles.headerTextStyle),
                        ),
                      ],
                    ),
                    Text('Numero de contacto'.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: Styles.bodyTextStyle)
                  ]),
              SizedBox(height: 40.0),
              Column(
                children: [
                  myWidgets.customButton(
                      context: context,
                      labelText: 'Ver dettalles',
                      route: null),
                  SizedBox(
                    height: 13.0,
                  ),
                  myWidgets.customButton(
                      maxWidth: MediaQuery.of(context).size.width * 0.75,
                      context: context,
                      route: null,
                      labelText: 'Consultar situacion del mercado',
                      isMain: false),
                  SizedBox(
                    height: 13.0,
                  ),
                  myWidgets.customButton(
                      maxWidth: MediaQuery.of(context).size.width * 0.58,
                      context: context,
                      route: null,
                      labelText: 'Realizar flujo de caja',
                      isMain: false,
                      isAccent: true),
                ],
              ),
              SizedBox(
                height: 40.0,
              )
            ],
          ),
        ));
  }
}

class GetClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height / 3.5);
    path.lineTo(size.width, size.height / 7.5);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
