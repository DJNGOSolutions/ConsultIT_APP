import 'package:consult_it_app/utils/fadeAnimation.dart';
import 'package:consult_it_app/utils/router.dart';
import 'package:consult_it_app/utils/styles.dart';
import 'package:consult_it_app/utils/widgets_lib.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    // Background image
                    Positioned(
                      left: 0,
                      bottom: 0,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .7,
                      child: FadeAnimation(
                          .5,
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fitWidth,
                                    image:
                                        AssetImage('assets/images/bg2.png'))),
                          )),
                    ),
                    // Light 1
                    Positioned(
                      left: 30,
                      width: 80,
                      height: 180,
                      child: FadeAnimation(
                          1,
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/light-1.png'))),
                          )),
                    ),
                    // Light 2
                    Positioned(
                      left: 140,
                      width: 80,
                      height: 110,
                      child: FadeAnimation(
                          1.3,
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/light-2.png'))),
                          )),
                    ),
                    // Clock
                    Positioned(
                      right: 40,
                      top: 40,
                      width: 80,
                      height: 150,
                      child: FadeAnimation(
                          1.5,
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/clock.png'))),
                          )),
                    ),
                    // Main Information
                    Positioned(
                        // Login Title
                        child: FadeAnimation(
                            1.8,
                            Container(
                              margin: EdgeInsets.only(top: 120),
                              height: MediaQuery.of(context).size.height * .9,
                              padding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 25),
                              child: Column(
                                children: [
                                  Container(
                                    child: Center(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 50.0),
                                          child: Container(
                                            height: 110,
                                            width: 110,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    fit: BoxFit.contain,
                                                    image: AssetImage(
                                                        'assets/images/badge.png'))),
                                          ),
                                        ),
                                        Text(
                                          "Bienvenido a Consult it"
                                              .toUpperCase(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: Fonts.secondaryFont,
                                              color: MyColors.mainColor,
                                              fontSize: 24,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    )),
                                  ),
                                  // Space between title and input fields
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.1),
                                  // Input fields
                                  inputField('Ingrese su usuario', 'usuario',
                                      Icons.person),
                                  SizedBox(height: 25.0),
                                  inputField('Ingrese su contraseña',
                                      'contraseña', Icons.lock),
                                  // Space between input field and buttons
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.14),
                                  // Button row
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () => Navigator.pushNamed(
                                              context, HOME_ROUTE),
                                          child: Container(
                                            constraints: BoxConstraints(
                                                minWidth: 100, maxWidth: 135),
                                            height: 40,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 25),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: Color.fromRGBO(
                                                    3, 90, 166, 1),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: MyColors.mainColor
                                                          .withOpacity(0.4),
                                                      blurRadius: 20.0,
                                                      offset: Offset(0, 10))
                                                ]),
                                            child: Center(
                                              child: FittedBox(
                                                child: Text(
                                                  'Ingresar'.toUpperCase(),
                                                  style: TextStyle(
                                                      fontFamily:
                                                          Fonts.secondaryFont,
                                                      fontSize: 14,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () => {},
                                          child: Container(
                                            constraints: BoxConstraints(
                                                minWidth: 100, maxWidth: 135),
                                            height: 40,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 12),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: Color.fromRGBO(
                                                    64, 186, 213, 1),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: MyColors
                                                          .secondaryColor
                                                          .withOpacity(0.4),
                                                      blurRadius: 20.0,
                                                      offset: Offset(0, 10))
                                                ]),
                                            child: Center(
                                              child: FittedBox(
                                                child: Text(
                                                  'Nuevo Ingreso'.toUpperCase(),
                                                  style: TextStyle(
                                                      fontFamily:
                                                          Fonts.secondaryFont,
                                                      fontSize: 14,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )))
                  ],
                )),
          )),
    );
  }
}
