import 'package:consult_it_app/bloc/authentication_bloc.dart';
import 'package:consult_it_app/bloc/home_bloc.dart';
import 'package:consult_it_app/events/authentication_events.dart';
import 'package:consult_it_app/events/home_events.dart';
import 'package:consult_it_app/models/consultant_model.dart';
import 'package:consult_it_app/models/entrepreneur_model.dart';
import 'package:consult_it_app/models/user_model.dart';
import 'package:consult_it_app/pages/consultantProfile_page.dart';
import 'package:consult_it_app/pages/consultantsList_page.dart';
import 'package:consult_it_app/pages/profile_Page.dart';
import 'package:consult_it_app/pages/transactionsHistory_page.dart';
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
  User user = User();
  Entrepreneur entrepreneur = Entrepreneur();
  Consultant consultant = Consultant();
  bool isEntrepreneur = false;

  @override
  void initState() {
    _currentIndex = widget.currentIndex;
    user = _homeBloc.userRepository.user;
    if (user.tipo.toUpperCase() == "consultant".toUpperCase()) {
      consultant = _homeBloc.consultantRepository.consultant;
    } else {
      entrepreneur = _homeBloc.entrepreneurRepository.entrepreneur;
      isEntrepreneur = true;
    }
    print('Es ${user.tipo.toString()}');
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
                Container(
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: entrepreneur.businesses.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: myWidgets.businessWidget(
                              businessName:
                                  entrepreneur.businesses[index].comercialName,
                              context: context,
                              function: () => widget.homeBloc.add(
                                  ToMyBusinessDetailsPage(
                                      business:
                                          entrepreneur.businesses[index]))),
                        );
                      }),
                )
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

  _buildConsultantOptionsSection(BuildContext context) => Column(
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
                    action: "Mis comercios asesorados",
                    context: context,
                    actionImagePath: "assets/images/icons/FolderDataColor.png"),
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
                    action: "Consultar valoraciones del perfil",
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

  _buildHomeContainer(BuildContext context) {
    if (widget.currentIndex == 0) {
      return isEntrepreneur
          ? Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                children: _buildEntrepreneurHome(context, entrepreneur),
              ),
            )
          : Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                children: _buildConsultantHome(context, consultant),
              ));
    } else if (widget.currentIndex == 1) {
      return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: TransactionsHistory(
            homeBloc: _homeBloc,
          ));
    } else if (widget.currentIndex == 2) {
      return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: widget.homeBloc.userRepository.user.tipo.toUpperCase() ==
                  'Consultant'.toUpperCase()
              ? ConsultantProfilePage(homeBloc: widget.homeBloc)
              : ProfilePage(homeBloc: widget.homeBloc));
    } else {
      return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: isEntrepreneur
              ? _buildEntrepreneurHome(context, entrepreneur)
              : _buildConsultantHome(context, consultant),
        ),
      );
    }
  }

  List<Widget> _buildEntrepreneurHome(
      BuildContext context, Entrepreneur entrepreneur) {
    return [
      _buildMyBusinessSection(context),
      _buildMoreOptionsSection(context)
    ];
  }

  List<Widget> _buildConsultantHome(
      BuildContext context, Consultant consultant) {
    return [_buildConsultantOptionsSection(context)];
  }
}
