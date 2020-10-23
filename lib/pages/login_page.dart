import 'package:consult_it_app/utils/neumorphismWidgets/bottom_left_clipper.dart';
import 'package:consult_it_app/utils/neumorphismWidgets/bottom_left_clipper_bottom.dart';
import 'package:consult_it_app/utils/neumorphismWidgets/clip_shadow_path.dart';
import 'package:consult_it_app/utils/neumorphismWidgets/top_right_clipper.dart';
import 'package:consult_it_app/utils/neumorphismWidgets/top_right_clipper_bottom.dart';
import 'package:consult_it_app/utils/router.dart';
import 'package:consult_it_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:consult_it_app/utils/widgets_lib.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final boxShadow = BoxShadow(
      color: Colors.grey,
      offset: Offset(-5, 3),
      blurRadius: 5,
      spreadRadius: 10,
    );

    // Neumorphic colored container with 99% app width
    final widthNeuContainer = Container(
      width: width * 0.99,
      color: kNeumorphicColor,
    );

    // Neumorphic colored container with 99% app height
    final heightNeuContainer = Container(
      height: height * 0.99,
      color: kNeumorphicColor,
    );

    return Material(
      child: Stack(
        children: <Widget>[
          Align(
            child: ClipShadowPath(
              shadow: boxShadow,
              clipper: TopRightNeuClipperBtm(),
              child: widthNeuContainer,
            ),
          ),
          Align(
            alignment: Alignment(30, -1),
            child: ClipShadowPath(
              shadow: boxShadow,
              clipper: TopRightNeuClipper(),
              child: widthNeuContainer,
            ),
          ),
          Align(
            alignment: Alignment(0, 30.5),
            child: ClipShadowPath(
              shadow: boxShadow,
              clipper: BottomLeftNeuClipperBtm(),
              child: heightNeuContainer,
            ),
          ),
          Align(
            alignment: Alignment(0, 9),
            child: SizedBox(
              width: width,
              height: height * 0.99,
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: kHomeImage,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 80.5),
            child: ClipShadowPath(
              shadow: boxShadow,
              clipper: BottomLeftNeuClipper(),
              child: heightNeuContainer,
            ),
          ),
          Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 140, bottom: 80),
                  child: Material(
                      borderRadius: BorderRadius.circular(10),
                      shadowColor: kNeumorphicColor.withOpacity(0.5),
                      elevation: 12.0,
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          Text(
                            'Consult IT',
                            style: TextStyle(
                                fontSize: 58,
                                fontFamily: Fonts.secondaryFont,
                                fontWeight: FontWeight.bold,
                                color: MyColors.mainColor),
                          ),
                        ],
                      )),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 30),
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: MyColors.mainColor.withOpacity(0.3),
                                blurRadius: 15.0,
                                offset: Offset(0, 10))
                          ]),
                      child: inputField(
                          hintText: 'Ingrese su usuario',
                          labelText: 'usuario',
                          icon: Icons.person,
                          uppercase: true,
                          bold: true,
                          obscure: false)),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 30),
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: MyColors.mainColor.withOpacity(0.3),
                                blurRadius: 15.0,
                                offset: Offset(0, 10))
                          ]),
                      child: inputField(
                          hintText: 'Ingrese su contraseña',
                          labelText: 'contraseña',
                          bold: true,
                          icon: Icons.lock,
                          uppercase: true,
                          obscure: false)),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                    padding:
                        const EdgeInsets.only(top: 80.0, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(context, HOME_ROUTE),
                          child: Container(
                            constraints:
                                BoxConstraints(minWidth: 100, maxWidth: 150),
                            height: 45,
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color.fromRGBO(3, 90, 166, 1),
                                boxShadow: [
                                  BoxShadow(
                                      color:
                                          MyColors.mainColor.withOpacity(0.4),
                                      blurRadius: 20.0,
                                      offset: Offset(0, 10))
                                ]),
                            child: Center(
                              child: FittedBox(
                                child: Text(
                                  'Ingresar'.toUpperCase(),
                                  style: TextStyle(
                                      fontFamily: Fonts.secondaryFont,
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, REGISTRATION_ROUTE),
                          child: Container(
                            constraints:
                                BoxConstraints(minWidth: 100, maxWidth: 150),
                            height: 45,
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color.fromRGBO(64, 186, 213, 1),
                                boxShadow: [
                                  BoxShadow(
                                      color: MyColors.secondaryColor
                                          .withOpacity(0.4),
                                      blurRadius: 20.0,
                                      offset: Offset(0, 10))
                                ]),
                            child: Center(
                              child: FittedBox(
                                child: Text(
                                  'Registrarse'.toUpperCase(),
                                  style: TextStyle(
                                      fontFamily: Fonts.secondaryFont,
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}

final kNeumorphicColor = Color.fromRGBO(235, 228, 229, 1); // rgb(235, 228, 229)
final kHomeImage =
    'https://user-images.githubusercontent.com/31005114/78748465-b5327d00-799e-11ea-9f40-38d322a9531a.png';
