import 'package:consult_it_app/bloc/home_bloc.dart';
import 'package:consult_it_app/events/home_events.dart';
import 'package:consult_it_app/utils/bottom_navigation_bar.dart';
import 'package:consult_it_app/utils/styles.dart';
import 'package:consult_it_app/utils/widgets_lib.dart' as myWidgets;
import 'package:flutter/material.dart';

String imgPath =
    'https://www.seekpng.com/png/detail/966-9665493_my-profile-icon-blank-profile-image-circle.png';

class ConsultantProfilePage extends StatelessWidget {
  final String heroTag;
  final HomeBloc homeBloc;
  const ConsultantProfilePage(
      {Key key, this.heroTag = 'Image', @required this.homeBloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      ClipPath(
        child: Container(color: MyColors.mainColor.withOpacity(0.5)),
        clipper: GetClipper(),
      ),
      Positioned(
          width: MediaQuery.of(context).size.width,
          top: 30,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: <Widget>[
                Hero(
                  tag: heroTag,
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        color: MyColors.mainColor.withOpacity(0.8),
                        image: DecorationImage(
                            image: NetworkImage(imgPath), fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(75.0)),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 6.0,
                              color: Colors.black54,
                              spreadRadius: 2.0)
                        ]),
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Fernando Velasquez',
                  style: Styles.headerTextStyle.apply(fontSizeFactor: 1.3),
                ),
                SizedBox(height: 5.0),
                Text('Asesor Profesional'.toUpperCase(),
                    style: Styles.bodyTextStyle),
                SizedBox(height: 20.0),
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
                                    top: 8.0,
                                    left: 8.0,
                                    right: 8.0,
                                    bottom: 2.0),
                                child: Text('FerVelasquez',
                                    style: Styles.headerTextStyle),
                              ),
                              Text('usuario'.toUpperCase(),
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
                                    top: 8.0,
                                    left: 8.0,
                                    right: 8.0,
                                    bottom: 2.0),
                                child: Text('7855 9711',
                                    style: Styles.headerTextStyle),
                              ),
                              Text('Teléfono'.toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: Styles.bodyTextStyle)
                            ]),
                      ),
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
                                    top: 8.0,
                                    left: 8.0,
                                    right: 8.0,
                                    bottom: 2.0),
                                child: Text('\$7.50',
                                    style: Styles.headerTextStyle),
                              ),
                              Text('Precio por hora'.toUpperCase(),
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
                                    top: 8.0,
                                    left: 8.0,
                                    right: 8.0,
                                    bottom: 2.0),
                                child: FittedBox(
                                  child: Text('4.8 / 5.0',
                                      style: Styles.headerTextStyle.apply(
                                        fontSizeFactor: 1.1,
                                      )),
                                ),
                              ),
                              Text('Rating'.toUpperCase(),
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
                            child: Text('Tecnologia e Inovación',
                                style: Styles.headerTextStyle),
                          ),
                        ],
                      ),
                      Text('Especialidad en'.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: Styles.bodyTextStyle)
                    ]),
                SizedBox(height: 40.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    myWidgets.customButton(
                        context: context,
                        labelText: 'Editar Perfil',
                        function: () => homeBloc.add(ToEditProfilePage())),
                    myWidgets.customButton(
                        isMain: false,
                        context: context,
                        labelText: 'Metodos de pago',
                        function: null)
                  ],
                )
              ],
            ),
          ))
    ]);
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
