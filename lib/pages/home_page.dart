import 'package:consult_it_app/utils/styles.dart';
import 'package:consult_it_app/utils/router.dart';
import 'package:flutter/material.dart';
import '../utils/widgets_lib.dart' as myWidgets;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: MyColors.accentColor,
            ),
            onPressed: () => Navigator.pushNamed(context, LOGIN_ROUTE)),
        backgroundColor: MyColors.mainColor,
        title: Text('Bienvenido a Consult IT'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
              child: Text(
                'Aun no ha agregado ninguna empresa... Puedes agregar empresas solo tocando el boton "Agregar empresa" ',
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                child: myWidgets.customButton(
                    context: context,
                    labelText: 'Agregar Empresa',
                    route: "",
                    fontSize: 18.0,
                    isMain: false))
          ],
        ),
      ),
      floatingActionButton: myWidgets.faqbot(context),
    );
  }
}
