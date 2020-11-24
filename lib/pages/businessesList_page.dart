import 'package:consult_it_app/bloc/home_bloc.dart';
import 'package:consult_it_app/events/home_events.dart';
import 'package:consult_it_app/models/business_model.dart';
import 'package:consult_it_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:consult_it_app/utils/widgets_lib.dart' as myWidgets;

class BusinessesListPage extends StatefulWidget {
  final String heroTag, optionName;
  final HomeBloc homeBloc;
  final List<Business> myBusinesses;

  const BusinessesListPage(
      {Key key,
      @required this.heroTag,
      @required this.optionName,
      @required this.homeBloc,
      @required this.myBusinesses})
      : super(key: key);

  @override
  _BusinessesListPageState createState() => _BusinessesListPageState();
}

class _BusinessesListPageState extends State<BusinessesListPage> {
  HomeBloc get homeBloc => widget.homeBloc;
  List<Business> get myBusinesses => widget.myBusinesses;
  bool hasBusinesses = false;

  @override
  void initState() {
    if (myBusinesses != null && myBusinesses.length > 0) {
      hasBusinesses = true;
    } else {
      hasBusinesses = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myWidgets.customAppBar(
            context: context,
            canGoBack: true,
            function: () => widget.homeBloc.add(ToHomePage())),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: hasBusinesses
                ? ListView(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
                    children: <Widget>[
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Hero(
                              tag: widget.heroTag,
                              child: Container(
                                height: 50.0,
                                width: 50.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/icons/DataAnalytic.png'),
                                      fit: BoxFit.contain),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Text(widget.optionName,
                                  style: Styles.headerTextStyle),
                            )
                          ],
                        ),
                        SizedBox(height: 10.0),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: myBusinesses.length,
                            itemBuilder: (BuildContext context, int index) {
                              return myWidgets.businessItem(
                                  context: context,
                                  bloc: widget.homeBloc,
                                  business: myBusinesses[index]);
                            }),
                        SizedBox(
                          height: 40.0,
                        )
                      ])
                : Center(
                    child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Text(
                      'No hemos encontramos ningun negocio asociado a tu perfil...',
                      textAlign: TextAlign.center,
                      style: Styles.bodyTextStyle.apply(
                        color: MyColors.mainColor,
                      ),
                    ),
                  ))));
  }
}
