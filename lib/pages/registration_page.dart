import 'package:consult_it_app/utils/styles.dart';
import 'package:consult_it_app/utils/widgets_lib.dart';
import 'package:flutter/material.dart';
import 'package:consult_it_app/utils/router.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage>
    with TickerProviderStateMixin {
  TabController tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController =
        TabController(length: 2, vsync: this, initialIndex: selectedIndex);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          brightness: Brightness.light,
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          elevation: 0,
          actions: [
            IconButton(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                iconSize: 28,
                tooltip: 'Retroceder',
                icon: Icon(Icons.arrow_back),
                color: Color.fromRGBO(3, 90, 166, 1),
                onPressed: () => Navigator.pushNamed(context, LOGIN_ROUTE)),
          ]),
      resizeToAvoidBottomPadding: true,
      body: SafeArea(
          child: ListView(
        children: [
          // Titulo y logo
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0, right: 10),
            child: Container(
              height: 95,
              width: 85,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/logo.png'))),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10),
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Bienvenido a Consult IT',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: Fonts.secondaryFont,
                          color: MyColors.mainColor,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 25),
                  child: Text(
                    'Decide como deseas registrarte a Consult IT: Emprendedor o Asesor financiero.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: Fonts.secondaryFont,
                      color: MyColors.secondaryColor,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Tabs para emprendedor y asesores.
          TabBar(
            indicatorWeight: 3,
            indicatorColor: MyColors.accentColor,
            unselectedLabelColor: Colors.grey,
            labelColor: MyColors.mainColor,
            labelStyle: TextStyle(
                fontFamily: Fonts.primaryFont,
                fontSize: 16,
                fontWeight: FontWeight.bold),
            tabs: <Tab>[
              Tab(text: 'Emprendedor'),
              Tab(text: 'Asesor Financiero'),
            ],
            controller: tabController,
            onTap: (int index) {
              setState(() {
                selectedIndex = index;
                tabController.animateTo(index);
              });
            },
          ),
          //Tab Content
          Divider(height: 0),
          IndexedStack(
            children: <Widget>[
              Visibility(
                child: buildEmprendedorTab(),
                maintainState: true,
                visible: selectedIndex == 0,
              ),
              Visibility(
                child: buildAsesorTab(),
                maintainState: true,
                visible: selectedIndex == 1,
              ),
            ],
            index: selectedIndex,
          ),
        ],
      )),
    );
  }

  Widget buildEmprendedorTab() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: [
          // Inicio de contenedor para datos personales
          Container(
            margin: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(Icons.supervised_user_circle,
                            size: 28, color: Color.fromRGBO(3, 90, 166, 1)),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'DATOS PERSONALES',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: Fonts.primaryFont,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
                // Campos para ingresar informacion personal
                SizedBox(
                  height: 5,
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
                      // Nombre segun documento de identidad
                      inputField(
                          hintText: 'Ingrese su(s) nombre(s)',
                          labelText: 'Nombre(s)',
                          icon: Icons.person_outline,
                          uppercase: false,
                          bold: false),
                      // Apellidos segun documento de identidad
                      inputField(
                          hintText: 'Ingrese su(s) apellido(s)',
                          labelText: 'Apellido(s)',
                          icon: Icons.person_outline,
                          uppercase: false,
                          bold: false),
                      // Correo Electronico
                      inputField(
                          hintText: 'Ingrese su correo',
                          labelText: 'Correo electrónico',
                          icon: Icons.email,
                          uppercase: false,
                          bold: false),
                      // Telefono de contacto
                      inputField(
                          hintText: 'Ingrese su telefono de contacto',
                          labelText: 'Telefono de contacto',
                          icon: Icons.phone,
                          uppercase: false,
                          bold: false),
                      // Fecha de Nacimiento
                      inputField(
                          hintText: 'Día/Mes/Año. Ej 07/09/1997',
                          labelText: 'Fecha de Nacimiento',
                          icon: Icons.calendar_today,
                          uppercase: false,
                          bold: false),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Fin de datos personales

          // Inicio de contenedor para informacion de residencia
          Container(
            margin: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(Icons.my_location,
                            size: 28, color: Color.fromRGBO(3, 90, 166, 1)),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'DATOS DE RESIDENCIA',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: Fonts.primaryFont,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
                // Campos para ingresar informacion de residencia
                SizedBox(
                  height: 5,
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
                      // Pais de residencia
                      inputField(
                          hintText: 'Ingrese su país de residencía',
                          labelText: 'Pais',
                          icon: Icons.location_on,
                          uppercase: false,
                          bold: false),
                      // Ciudad de residencia
                      inputField(
                        hintText: 'Ingrese su ciudad de residencía',
                        labelText: 'Ciudad',
                        icon: Icons.location_city,
                        uppercase: false,
                        bold: false,
                      ),
                      // Codigo postal
                      inputField(
                        hintText: 'Ingrese su código postal',
                        labelText: 'Código postal',
                        icon: Icons.dialpad,
                        uppercase: false,
                        bold: false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Fin de datos de residencia

          // Inicio de contenedor para datos de la aplicacion
          Container(
            margin: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(Icons.person_add,
                            size: 28, color: Color.fromRGBO(3, 90, 166, 1)),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'REGISTRO DE USUARIO',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: Fonts.primaryFont,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
                // Campos para ingresar informacion de usuario
                SizedBox(
                  height: 5,
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
                      // Username
                      inputField(
                          hintText: 'Ingrese su usuario',
                          labelText: 'Nombre de usuario',
                          icon: Icons.person_outline,
                          uppercase: false,
                          bold: false),
                      // Password
                      inputField(
                          hintText: 'Ingrese su contraseña',
                          labelText: 'Contraseña',
                          icon: Icons.lock,
                          uppercase: false,
                          bold: false,
                          obscure: true),
                      // Repeat password
                      inputField(
                          hintText: 'Repita su contraseña',
                          labelText: 'Repetir contraseña',
                          icon: Icons.lock,
                          uppercase: false,
                          bold: false,
                          obscure: true),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Fin de datos de usuario
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
            child: customButton(
                context: context, labelText: 'Registrarse', route: HOME_ROUTE),
          )
        ],
      ),
    );
  }

  Widget buildAsesorTab() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: [
          // Inicio de contenedor para datos personales
          Container(
            margin: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(Icons.supervised_user_circle,
                            size: 28, color: Color.fromRGBO(3, 90, 166, 1)),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'DATOS PERSONALES',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: Fonts.primaryFont,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
                // Campos para ingresar informacion personal
                SizedBox(
                  height: 5,
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
                      // Nombre segun documento de identidad
                      inputField(
                          hintText: 'Ingrese su(s) nombre(s)',
                          labelText: 'Nombre(s)',
                          icon: Icons.person_outline,
                          uppercase: false,
                          bold: false),
                      // Apellidos segun documento de identidad
                      inputField(
                          hintText: 'Ingrese su(s) apellido(s)',
                          labelText: 'Apellido(s)',
                          icon: Icons.person_outline,
                          uppercase: false,
                          bold: false),
                      // Correo Electronico
                      inputField(
                          hintText: 'Ingrese su correo',
                          labelText: 'Correo electrónico',
                          icon: Icons.email,
                          uppercase: false,
                          bold: false),
                      // Telefono de contacto
                      inputField(
                          hintText: 'Ingrese su telefono de contacto',
                          labelText: 'Telefono de contacto',
                          icon: Icons.phone,
                          uppercase: false,
                          bold: false),
                      // Fecha de Nacimiento
                      inputField(
                          hintText: 'Día/Mes/Año. Ej 07/09/1997',
                          labelText: 'Fecha de Nacimiento',
                          icon: Icons.calendar_today,
                          uppercase: false,
                          bold: false),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Fin de datos personales

          // Inicio de contenedor para informacion de informacion profesional
          Container(
            margin: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(Icons.verified_user,
                            size: 28, color: Color.fromRGBO(3, 90, 166, 1)),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'INFORMACION PROFESIONAL',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: Fonts.primaryFont,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
                // Campos para ingresar informacion de residencia
                SizedBox(
                  height: 5,
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
                      // Pais de residencia
                      inputField(
                          hintText:
                              'Ej. Licenciado, Economista, Ingeniero, etc.',
                          labelText: 'Titulo profesional',
                          icon: Icons.picture_in_picture,
                          uppercase: false,
                          bold: false),
                      // Ciudad de residencia
                      inputField(
                        hintText: 'Precio de preferencia por hora',
                        labelText: 'Precio base por hora de consulta',
                        icon: Icons.attach_money,
                        uppercase: false,
                        bold: false,
                      ),
                      // Codigo postal
                      inputField(
                        hintText: 'Ej. Tecnologia, startups, textiles, etc',
                        labelText: 'Giro de especializacion',
                        icon: Icons.keyboard,
                        uppercase: false,
                        bold: false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Fin de datos de profesionales

          // Inicio de contenedor para informacion de residencia
          Container(
            margin: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(Icons.my_location,
                            size: 28, color: Color.fromRGBO(3, 90, 166, 1)),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'DATOS DE RESIDENCIA',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: Fonts.primaryFont,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
                // Campos para ingresar informacion de residencia
                SizedBox(
                  height: 5,
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
                      // Pais de residencia
                      inputField(
                          hintText: 'Ingrese su país de residencía',
                          labelText: 'Pais',
                          icon: Icons.location_on,
                          uppercase: false,
                          bold: false),
                      // Ciudad de residencia
                      inputField(
                        hintText: 'Ingrese su ciudad de residencía',
                        labelText: 'Ciudad',
                        icon: Icons.location_city,
                        uppercase: false,
                        bold: false,
                      ),
                      // Codigo postal
                      inputField(
                        hintText: 'Ingrese su código postal',
                        labelText: 'Código postal',
                        icon: Icons.dialpad,
                        uppercase: false,
                        bold: false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Fin de datos de residencia

          // Inicio de contenedor para datos de la aplicacion
          Container(
            margin: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(Icons.person_add,
                            size: 28, color: Color.fromRGBO(3, 90, 166, 1)),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'REGISTRO DE USUARIO',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: Fonts.primaryFont,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
                // Campos para ingresar informacion de usuario
                SizedBox(
                  height: 5,
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
                      // Username
                      inputField(
                          hintText: 'Ingrese su usuario',
                          labelText: 'Nombre de usuario',
                          icon: Icons.person_outline,
                          uppercase: false,
                          bold: false),
                      // Password
                      inputField(
                          hintText: 'Ingrese su contraseña',
                          labelText: 'Contraseña',
                          icon: Icons.lock,
                          uppercase: false,
                          bold: false,
                          obscure: true),
                      // Repeat password
                      inputField(
                          hintText: 'Repita su contraseña',
                          labelText: 'Repetir contraseña',
                          icon: Icons.lock,
                          uppercase: false,
                          bold: false,
                          obscure: true),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Fin de datos de usuario
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
            child: customButton(
                context: context, labelText: 'Registrarse', route: HOME_ROUTE),
          )
        ],
      ),
    );
  }
}
