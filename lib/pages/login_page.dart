import 'package:consult_it_app/bloc/authentication_bloc.dart';
import 'package:consult_it_app/events/authentication_events.dart';
import 'package:consult_it_app/utils/neumorphismWidgets/bottom_left_clipper.dart';
import 'package:consult_it_app/utils/neumorphismWidgets/bottom_left_clipper_bottom.dart';
import 'package:consult_it_app/utils/neumorphismWidgets/clip_shadow_path.dart';
import 'package:consult_it_app/utils/neumorphismWidgets/top_right_clipper.dart';
import 'package:consult_it_app/utils/neumorphismWidgets/top_right_clipper_bottom.dart';
import 'package:consult_it_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:consult_it_app/utils/widgets_lib.dart';

class LoginPage extends StatelessWidget {
  final AuthenticationBloc authenticationBloc;

  const LoginPage({Key key, @required this.authenticationBloc})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    TextEditingController _usernameController = TextEditingController(),
        _passwordController = TextEditingController();

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
                  padding: const EdgeInsets.only(top: 140, bottom: 40),
                  child: Material(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          Container(
                            height: 180,
                            width: 250,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/logo.png'))),
                          ),
                        ],
                      )),
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
                      child: inputField(_usernameController,
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
                      child: inputField(_passwordController,
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
                          onTap: () => authenticationBloc.add(LoggedIn(
                              username: _usernameController.text,
                              password: _passwordController.text)),
                          child: Container(
                            constraints:
                                BoxConstraints(minWidth: 100, maxWidth: 150),
                            height: 45,
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: MyColors.mainColor,
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
                              authenticationBloc.add(ToRegistrationForm()),
                          child: Container(
                            constraints:
                                BoxConstraints(minWidth: 100, maxWidth: 150),
                            height: 45,
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: MyColors.secondaryColor,
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
