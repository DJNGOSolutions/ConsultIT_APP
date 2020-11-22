import 'package:consult_it_app/bloc/home_bloc.dart';
import 'package:consult_it_app/events/home_events.dart';
import 'package:consult_it_app/models/consultant_model.dart';
import 'package:consult_it_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:consult_it_app/utils/widgets_lib.dart' as myWidgets;

class ConsultantsListPage extends StatelessWidget {
  final String heroTag, imgPath, optionName;
  final HomeBloc homeBloc;
  final List<Consultant> consultant;

  const ConsultantsListPage(
      {Key key,
      @required this.heroTag,
      @required this.imgPath,
      @required this.optionName,
      @required this.homeBloc,
      @required this.consultant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myWidgets.customAppBar(
            context: context,
            canGoBack: true,
            function: () => homeBloc.add(ToHomePage())),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: (consultant.length > 0 && consultant != null)
                ? ListView(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
                    children: <Widget>[
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Hero(
                              tag: heroTag,
                              child: Container(
                                height: 50.0,
                                width: 50.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(imgPath),
                                      fit: BoxFit.contain),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Text(optionName,
                                  style: Styles.headerTextStyle),
                            )
                          ],
                        ),
                        SizedBox(height: 10.0),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: consultant.length,
                            itemBuilder: (BuildContext context, int index) {
                              return myWidgets.staffItem(
                                  context: context,
                                  bloc: homeBloc,
                                  consultant: consultant[index]);
                            }),
                        SizedBox(
                          height: 40.0,
                        )
                      ])
                : Center(
                    child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Text(
                      'No se encontro ningun consultor por el momento...',
                      textAlign: TextAlign.center,
                      style: Styles.bodyTextStyle.apply(
                        color: MyColors.mainColor,
                      ),
                    ),
                  ))));
  }
}
