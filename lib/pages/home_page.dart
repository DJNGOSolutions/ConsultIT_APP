import 'package:consult_it_app/utils/styles.dart';
import 'package:consult_it_app/utils/router.dart';
import 'package:flutter/material.dart';
import '../utils/widgets_lib.dart' as myWidgets;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: MyColors.mainColor,
            ),
            onPressed: () => Navigator.pushNamed(context, LOGIN_ROUTE)),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: Text(
                "CONSULT",
                style: Styles.headerTextStyle.apply(color: MyColors.mainColor),
              ),
            ),
            Text(
              "IT",
              style: Styles.headerTextStyle.apply(color: MyColors.accentColor),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.11,
            )
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [_buildMyBusinessSection(context)],
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
                  flex: 4,
                  fit: FlexFit.loose,
                ),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Mis Proyectos',
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
          Container(
            margin: EdgeInsets.only(top: 15.0, left: 15.0),
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
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
}
