import 'package:consult_it_app/bloc/authentication_bloc.dart';
import 'package:consult_it_app/bloc/home_bloc.dart';
import 'package:consult_it_app/events/authentication_events.dart';
import 'package:consult_it_app/events/home_events.dart';
import 'package:consult_it_app/pages/consultantsList_page.dart';
import 'package:consult_it_app/pages/profile_Page.dart';
import 'package:consult_it_app/states/home_states.dart';
import 'package:consult_it_app/utils/bottom_navigation_bar.dart';
import 'package:consult_it_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../utils/widgets_lib.dart' as myWidgets;

class HomePage extends StatefulWidget {
  final HomeBloc homeBloc;
  final AuthenticationBloc authenticationBloc;
  final int currentIndex;

  const HomePage(
      {Key key,
      @required this.homeBloc,
      @required this.authenticationBloc,
      @required this.currentIndex})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex;
  HomeBloc get _homeBloc => widget.homeBloc;
  @override
  void initState() {
    _currentIndex = widget.currentIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: myWidgets.customAppBar(
          context: context,
          function: () => widget.authenticationBloc.add(LoggedOut())),
      body: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is ChangeHomeContainer) {
            _currentIndex = state.currentIndex;
          }
        },
        child: _buildHomeContainer(context),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        homeBloc: _homeBloc,
      ),
      floatingActionButton:
          myWidgets.faqbot(function: () => _homeBloc.add(ToFAQBotPage())),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  _buildMyBusinessSection(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(top: 12.0, right: 0.0, left: 20.0),
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
                              onPressed:
                                  null) //Navigator.pushNamed(context, MY_BUSINESS_PAGE)),
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
            height: 170,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: () => widget.homeBloc.add(ToAddBusinessPage()),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: myWidgets.addBusinessWidget(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: myWidgets.businessWidget(
                      businessName: "Venta de textiles s.a. de c.v.",
                      context: context,
                      function: () =>
                          widget.homeBloc.add(ToMyBusinessDetailsPage())),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 8.0),
                //   child: myWidgets.businessWidget(
                //       businessName: "Tienda de ropa online",
                //       businessImage: "assets/images/icons/OnlineShoping.png",
                //       context: context,
                //       routeName: BUSINESS_PROFILE_PAGE),
                // ),
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
            padding: const EdgeInsets.only(top: 12.0, right: 0.0, left: 20.0),
            child: Row(
              children: [
                Flexible(
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/icons/Manager.png'))),
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
                          'Consultas',
                          style: Styles.headerTextStyle,
                        ),
                      ),
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
                    function: () =>
                        widget.homeBloc.add(ToConsultantsListPage()),
                    action: "Consultar cartera de asesores",
                    context: context,
                    actionImagePath:
                        "assets/images/icons/BookProfesionals.png"),
                SizedBox(
                  height: 10.0,
                ),
                myWidgets.actionWidget(
                    function: () => widget.homeBloc.add(ToAnalizeMarketPage()),
                    action: "Analizar Mercado",
                    context: context,
                    actionImagePath:
                        "assets/images/icons/MarketFluctuation.png"),
                SizedBox(
                  height: 10.0,
                ),
                myWidgets.actionWidget(
                    function: () => widget.homeBloc.add(ToMyBusinessesList()),
                    action: "Analizar mis comercios",
                    context: context,
                    actionImagePath: "assets/images/icons/DataAnalytic.png"),
                SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          )
        ],
      );

  Widget _buildHomeContainer(BuildContext context) {
    if (widget.currentIndex == 0) {
      return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            _buildMyBusinessSection(context),
            _buildMoreOptionsSection(context)
          ],
        ),
      );
    } else if (widget.currentIndex == 1) {
      return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ConsultantsListPage(
            heroTag: 'ConsultantName',
            imgPath: 'assets/images/icons/BookProfesionals.png',
            optionName: 'Cartera de asesores',
            homeBloc: _homeBloc,
          ));
    } else if (widget.currentIndex == 2) {
      return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ProfilePage(homeBloc: widget.homeBloc));
    } else {
      return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            _buildMyBusinessSection(context),
            _buildMoreOptionsSection(context)
          ],
        ),
      );
    }
  }
}
