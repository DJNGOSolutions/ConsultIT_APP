import 'package:consult_it_app/bloc/home_bloc.dart';
import 'package:consult_it_app/events/home_events.dart';
import 'package:consult_it_app/models/consultant_model.dart';
import 'package:consult_it_app/utils/styles.dart';
import 'package:consult_it_app/utils/widgets_lib.dart' as myWidgets;
import 'package:flutter/material.dart';

String imgPath =
    'https://www.seekpng.com/png/detail/966-9665493_my-profile-icon-blank-profile-image-circle.png';

class ConsultantProfilePage extends StatefulWidget {
  final String heroTag;
  final HomeBloc homeBloc;
  const ConsultantProfilePage({
    Key key,
    this.heroTag = 'Image',
    @required this.homeBloc,
  }) : super(key: key);

  @override
  _ConsultantProfilePageState createState() => _ConsultantProfilePageState();
}

class _ConsultantProfilePageState extends State<ConsultantProfilePage> {
  Consultant consultant = new Consultant();
  HomeBloc get homeBloc => widget.homeBloc;

  @override
  void initState() {
    consultant = homeBloc.consultantRepository.consultant;
    super.initState();
  }

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
                  tag: widget.heroTag,
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
                  '${consultant.firstname} ${consultant.lastName}',
                  style: Styles.headerTextStyle.apply(fontSizeFactor: 1.3),
                ),
                SizedBox(height: 5.0),
                Text(consultant.deegre ?? ''.toUpperCase(),
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
                                child: Text(consultant.user.username,
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
                                child: Text(consultant.phoneNumber,
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
                                child: Text('\$${consultant.referencePrice}',
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
                                  child:
                                      Text('${consultant.averageRating} / 5.0',
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
                            child: Text(consultant.consultantType,
                                style: Styles.headerTextStyle),
                          ),
                        ],
                      ),
                      Text('Especialidad en '.toUpperCase(),
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
                        function: () =>
                            widget.homeBloc.add(ToEditProfilePage())),
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
