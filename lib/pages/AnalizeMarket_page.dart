import 'package:consult_it_app/bloc/home_bloc.dart';
import 'package:consult_it_app/events/home_events.dart';
import 'package:consult_it_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:consult_it_app/utils/widgets_lib.dart' as myWidgets;

class AnalizeMarketPage extends StatefulWidget {
  final HomeBloc homeBloc;
  final String heroTag, optionName;

  const AnalizeMarketPage(
      {Key key,
      @required this.homeBloc,
      @required this.heroTag,
      @required this.optionName})
      : super(key: key);

  @override
  _AnalizeMarketPageState createState() => _AnalizeMarketPageState();
}

class _AnalizeMarketPageState extends State<AnalizeMarketPage> {
  HomeBloc get homeBloc => widget.homeBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myWidgets.customAppBar(
          context: context,
          function: () => homeBloc.add(ToHomePage()),
          canGoBack: true),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              children: <Widget>[
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: Hero(
                        tag: widget.heroTag,
                        child: Container(
                          height: 50.0,
                          width: 50.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/icons/MarketFluctuation.png'),
                                fit: BoxFit.contain),
                          ),
                        ),
                      ),
                      flex: 2,
                      fit: FlexFit.tight,
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Text(widget.optionName.toUpperCase(),
                            style: Styles.headerTextStyle),
                      ),
                      flex: 9,
                      fit: FlexFit.tight,
                    )
                  ],
                ),
                SizedBox(height: 10.0),
                SizedBox(
                  height: 40.0,
                )
              ])),
    );
  }
}
