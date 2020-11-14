import 'package:consult_it_app/utils/bottom_navigation_bar.dart';
import 'package:consult_it_app/utils/router.dart';
import 'package:consult_it_app/utils/styles.dart';
import 'package:consult_it_app/utils/widgets_lib.dart' as myWidgets;
import 'package:flutter/material.dart';

String imgPath =
    'https://www.seekpng.com/png/detail/966-9665493_my-profile-icon-blank-profile-image-circle.png';

class ProfilePage extends StatelessWidget {
  final String heroTag;
  const ProfilePage({Key key, this.heroTag = 'Image'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myWidgets.customAppBar(context: context),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 2,
      ),
      floatingActionButton: myWidgets.faqbot(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: Stack(children: <Widget>[
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
                          color: Colors.red,
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
                    'Ronald Vega',
                    style: Styles.headerTextStyle.apply(fontSizeFactor: 1.3),
                  ),
                  SizedBox(height: 5.0),
                  Text('Emprendedor/a'.toUpperCase(),
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
                                  child: Text('RonaldVega14',
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
                                  child: Text('6313 9711',
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
                                  child: Text('La Libertad',
                                      style: Styles.headerTextStyle),
                                ),
                                Text('Departamento'.toUpperCase(),
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
                                  child: Text('Antiguo Cuscatlan',
                                      textAlign: TextAlign.center,
                                      style: Styles.headerTextStyle),
                                ),
                                Text('Municipio'.toUpperCase(),
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
                              child: Text('07/09/1997',
                                  style: Styles.headerTextStyle),
                            ),
                          ],
                        ),
                        Text('Fecha de nacimiento'.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: Styles.bodyTextStyle)
                      ]),
                  SizedBox(height: 40.0),
                  myWidgets.customButton(
                      context: context,
                      labelText: 'Editar Perfil',
                      route: EDIT_PROFILE_PAGE)
                ],
              ),
            ))
      ]),
    );
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
