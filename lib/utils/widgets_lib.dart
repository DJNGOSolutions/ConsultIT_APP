import 'package:consult_it_app/models/faqmessage_model.dart';
import 'package:consult_it_app/utils/router.dart';
import 'package:consult_it_app/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neumorphic/neumorphic.dart';
import '../utils/router.dart';

//FAB para el bot
Widget faqbot(BuildContext context) {
  return FloatingActionButton(
    backgroundColor: MyColors.mainColor,
    foregroundColor: MyColors.accentColor,
    onPressed: () => Navigator.pushNamed(context, FAQ_BOT_ROUTE),
    tooltip: 'Preguntanos lo que desees',
    child: Center(
      child: Container(
        margin:
            const EdgeInsets.only(top: 4.0, bottom: 4.0, left: 4.0, right: 4.0),
        height: 35,
        width: 40,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/icons/FAQ.png'))),
      ),
    ),
  );
}

//Widget que se utiliza para los mensajes con el bot
Widget faqMessage(
    {@required FAQMessage message, @required BuildContext context}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: message.type
              ? _userMessage(context, message)
              : _botMessage(context, message),
        ),
      ),
      Divider(
        height: 2,
      )
    ],
  );
}

//Mensaje de respuessta del bot
List<Widget> _botMessage(BuildContext context, FAQMessage message) {
  return <Widget>[
    Container(
      margin: const EdgeInsets.only(right: 16.0),
      width: 60.0,
      height: 55.0,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/logo.png"))),
    ),
    Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(message.sender,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          Container(
            margin: const EdgeInsets.only(top: 5.0),
            child: Text(message.message, style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    ),
  ];
}

List<Widget> _userMessage(context, FAQMessage message) {
  return <Widget>[
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(message.sender,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          Container(
            margin: const EdgeInsets.only(top: 5.0),
            child: Text(message.message, style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    ),
    Container(
      margin: const EdgeInsets.only(left: 16.0),
      child: CircleAvatar(
          backgroundColor: MyColors.mainColor,
          child: Text(
            message.sender.substring(0, 1) +
                message.sender.split(' ').last.substring(0, 1),
            style: TextStyle(fontSize: 20, color: MyColors.accentColor),
          )),
    ),
  ];
}

// Campo para ingresar texto
inputField(
        {@required String hintText,
        @required String labelText,
        @required IconData icon,
        bool uppercase = true,
        bool bold = true,
        bool obscure = false}) =>
    TextField(
      obscureText: obscure,
      decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: MyColors.textFieldColor,
          ),
          contentPadding: EdgeInsets.only(left: 8, top: 2, bottom: 2, right: 4),
          labelText: uppercase ? labelText.toUpperCase() : labelText,
          labelStyle: TextStyle(
              fontFamily: Fonts.primaryFont,
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
              color: MyColors.textFieldColor),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
              fontSize: 14,
              fontFamily: Fonts.primaryFont,
              color: MyColors.textFieldColor.withOpacity(0.7))),
    );

customButton(
        {@required BuildContext context,
        @required String labelText,
        bool isMain = true,
        bool isAccent = false,
        @required String route,
        double fontSize = 14.0}) =>
    GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        constraints: BoxConstraints(minWidth: 100, maxWidth: 150),
        height: 45,
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isMain
                ? MyColors.mainColor
                : isAccent ? MyColors.accentColor : MyColors.secondaryColor,
            boxShadow: [
              BoxShadow(
                  color: isAccent
                      ? Colors.grey.withOpacity(0.4)
                      : MyColors.mainColor.withOpacity(0.4),
                  blurRadius: 8.0,
                  offset: Offset(0, 7))
            ]),
        child: Center(
          child: FittedBox(
            child: Text(
              labelText.toUpperCase(),
              style: TextStyle(
                  fontFamily: Fonts.secondaryFont,
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ),
    );

Widget addBusinessWidget() {
  return Tooltip(
    message: "Agregar un nuevo comercio",
    child: NeuCard(
      bevel: 24,
      curveType: CurveType.emboss,
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
      margin: EdgeInsets.only(top: 10.0, right: 15.0),
      decoration: NeumorphicDecoration(
          borderRadius: BorderRadius.circular(12.0), color: Colors.white),
      width: 190,
      height: 140,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            fit: FlexFit.loose,
            flex: 6,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                          AssetImage('assets/images/icons/Unsubscribed.png'))),
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
              child: Text(
                'Agregar nuevo comercio'.toUpperCase(),
                style: Styles.bodyTextStyle.apply(color: Colors.black54),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget businessWidget(
    {@required String businessName,
    String businessImage = 'assets/images/icons/FolderDataColor.png'}) {
  return Tooltip(
    message: "Ver detalle de: ${businessName.toUpperCase()}",
    child: NeuCard(
        bevel: 24,
        curveType: CurveType.emboss,
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(top: 10.0, right: 15.0),
        decoration: NeumorphicDecoration(
            borderRadius: BorderRadius.circular(12.0), color: Colors.white),
        width: 190,
        height: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(businessImage))),
              ),
              fit: FlexFit.loose,
              flex: 3,
            ),
            SizedBox(
              height: 30.0,
            ),
            Flexible(
              child: Text(
                businessName.toUpperCase(),
                style: Styles.bodyTextStyle.apply(color: Colors.black54),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
              fit: FlexFit.loose,
              flex: 4,
            ),
          ],
        )),
  );
}

// TODO: Agregar menu lateral
Widget customAppBar({BuildContext context, bool canGoBack = false}) => AppBar(
      bottomOpacity: 0,
      toolbarOpacity: 1.0,
      leading: Padding(
        padding:
            const EdgeInsets.only(left: 8.0, top: 4.0, right: 4.0, bottom: 4.0),
        child: Tooltip(
          message: "Menú",
          child: NeuCard(
            bevel: 16,
            curveType: CurveType.concave,
            decoration: NeumorphicDecoration(
                borderRadius: BorderRadius.circular(12.0), color: Colors.white),
            child: Icon(
              Icons.menu,
              color: MyColors.mainColor,
            ),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(
              left: 4.0, top: 4.0, right: 12.0, bottom: 4.0),
          child: Tooltip(
            message: canGoBack ? "Retroceder" : "Cerrar Sesión",
            child: GestureDetector(
              onTap: () => canGoBack
                  ? Navigator.canPop(context)
                      ? Navigator.pop(context)
                      : Navigator.pushNamed(context, HOME_ROUTE)
                  : Navigator.pushNamed(context, LOGIN_ROUTE),
              child: NeuCard(
                bevel: 16.0,
                curveType: CurveType.concave,
                decoration: NeumorphicDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.white),
                child: canGoBack
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.arrow_back,
                          size: 30,
                          color: MyColors.mainColor,
                        ),
                      )
                    : Container(
                        margin: const EdgeInsets.all(8.0),
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/icons/LogOut.png'))),
                      ),
              ),
            ),
          ),
        ),
      ],
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(8.0),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/appBar_logo.png'))),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 3.0),
                child: Text(
                  "Consult",
                  style: Styles.neumorphicTextStyle(
                      fontWeight: FontWeight.bold,
                      color: MyColors.mainColor,
                      blurRadius: 15,
                      size: 24.0),
                ),
              ),
              Text(
                "IT",
                style: Styles.neumorphicTextStyle(
                    fontWeight: FontWeight.bold,
                    color: MyColors.accentColor,
                    blurRadius: 15.0,
                    size: 24.0),
              ),
              SizedBox(
                width: 3.0,
              )
            ],
          )
        ],
      ),
    );

// TODO: Agregar navegacion a nueva ruta (Crear un router para esta navegacion).
Widget actionWidget({
  @required String action,
  String actionImagePath = 'assets/images/icons/FolderDataColor.png',
  String route,
  @required BuildContext context,
}) {
  return Tooltip(
    message: "Ir a ${action.toUpperCase()}",
    child: NeuCard(
        bevel: 24,
        curveType: CurveType.emboss,
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(top: 10.0, right: 15.0, left: 15.0),
        decoration: NeumorphicDecoration(
            borderRadius: BorderRadius.circular(12.0), color: Colors.white),
        width: MediaQuery.of(context).size.width,
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              child: Container(
                height: 65,
                width: 65,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(actionImagePath))),
              ),
              fit: FlexFit.loose,
              flex: 3,
            ),
            SizedBox(
              height: 30.0,
            ),
            Flexible(
              child: Text(
                action.toUpperCase(),
                style: Styles.bodyTextStyle.apply(color: Colors.black54),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
              fit: FlexFit.loose,
              flex: 4,
            ),
          ],
        )),
  );
}
