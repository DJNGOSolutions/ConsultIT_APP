import 'package:consult_it_app/utils/styles.dart';
import 'package:flutter/material.dart';
import '../utils/widgets_lib.dart' as myWidgets;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: myWidgets.customAppBar(context),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            _buildMyBusinessSection(context),
            _buildMoreOptionsSection(context)
          ],
        ),
      ),
      floatingActionButton: myWidgets.faqbot(context),
    );
  }

  _buildMyBusinessSection(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(top: 15.0, right: 0.0, left: 20.0),
            child: Row(
              children: [
                Flexible(
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/icons/ProjectManagement.png'))),
                  ),
                  flex: 1,
                  fit: FlexFit.loose,
                ),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Mis Comercios',
                          style: Styles.headerTextStyle,
                        ),
                      ),
                      Tooltip(
                        message: "Ver todos mis comercios",
                        child: IconButton(
                            icon: Icon(
                              Icons.arrow_forward,
                              color: MyColors.mainColor,
                            ),
                            onPressed: null),
                      )
                    ],
                  ),
                  flex: 7,
                  fit: FlexFit.tight,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15.0, left: 15.0),
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 5.0),
                  child: myWidgets.businessWidget(
                      businessName: "Venta de textiles s.a. de c.v."),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: myWidgets.businessWidget(
                      businessName: "Tienda de ropa online",
                      businessImage: "assets/images/icons/OnlineShoping.png"),
                ),
                myWidgets.addBusinessWidget()
              ],
            ),
          )
        ],
      );

  _buildMoreOptionsSection(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(top: 15.0, right: 0.0, left: 20.0),
            child: Row(
              children: [
                Flexible(
                  child: Icon(
                    Icons.more_vert,
                    size: 35.0,
                    color: MyColors.mainColor,
                  ),
                  flex: 1,
                  fit: FlexFit.loose,
                ),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Más Acciones',
                          style: Styles.headerTextStyle,
                        ),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.arrow_forward,
                            color: MyColors.mainColor,
                          ),
                          onPressed: null)
                    ],
                  ),
                  flex: 7,
                  fit: FlexFit.tight,
                )
              ],
            ),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                myWidgets.actionWidget(
                    action: "Consultar cartera de asesores",
                    context: context,
                    actionImagePath:
                        "assets/images/icons/BookProfesionals.png"),
                SizedBox(
                  height: 10.0,
                ),
                myWidgets.actionWidget(
                    action: "Consultar fluctuación del mercado",
                    context: context,
                    actionImagePath:
                        "assets/images/icons/MarketFluctuation.png"),
                SizedBox(
                  height: 10.0,
                ),
                myWidgets.actionWidget(
                    action: "Obtener analisis de cuentas para un comercio",
                    context: context,
                    actionImagePath: "assets/images/icons/DataAnalytic.png")
              ],
            ),
          )
        ],
      );
}
