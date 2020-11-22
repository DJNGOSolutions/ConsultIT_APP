import 'package:consult_it_app/bloc/home_bloc.dart';
import 'package:consult_it_app/events/home_events.dart';
import 'package:consult_it_app/models/consultant_model.dart';
import 'package:consult_it_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:consult_it_app/utils/widgets_lib.dart' as myWidgets;

class TransactionsHistory extends StatelessWidget {
  final HomeBloc homeBloc;

  const TransactionsHistory({
    Key key,
    @required this.homeBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'No ha realizado ninguna transaccion por medio de ConsultIT.',
                      textAlign: TextAlign.center,
                      style: Styles.bodyTextStyle.apply(
                        color: MyColors.mainColor,
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Container(
                      height: 80,
                      width: 140,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/logo.png'))),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                  ],
                ))));
  }
}
