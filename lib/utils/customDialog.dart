import 'dart:io';

import 'package:consult_it_app/bloc/home_bloc.dart';
import 'package:consult_it_app/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomSelectImageWidget extends StatefulWidget {
  final image, index;
  final HomeBloc homeBloc;

  const CustomSelectImageWidget({
    Key key,
    @required this.image,
    @required this.index,
    @required this.homeBloc,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => CustomSelectImageWidgetState();
}

class CustomSelectImageWidgetState extends State<CustomSelectImageWidget>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;
  //getters
  File get _image => widget.image;
  int get _index => widget.index;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 350));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Center(
            child: Material(
          color: Colors.transparent,
          child: ScaleTransition(
            scale: scaleAnimation,
            child: buildGaleriaCamara(MediaQuery.of(context).size.height * .35,
                MediaQuery.of(context).size.width * .65, _image, _index),
          ),
        )));
  }

  void _openMedia() {
    print('Error al cargar imagen: ');
  }

  Widget buildGaleriaCamara(
      double height, double width, File image, int index) {
    return Center(
        child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Container(
              width: width,
              height: height,
              padding: const EdgeInsets.fromLTRB(25.0, 5.0, 25.0, 13.0),
              margin: const EdgeInsets.fromLTRB(25.0, 16.0, 25.0, 12.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24.0),
                  boxShadow: <BoxShadow>[
                    BoxShadow(spreadRadius: 2.0, color: Colors.white)
                  ]),
              child: ListView(
                reverse: false,
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  SizedBox(
                    height: height * 0.08,
                  ),
                  Text('UPLOAD IMAGE FROM', style: Styles.bodyTextStyle),
                  SizedBox(height: height * 0.08),
                  Material(
                    elevation: 3.0,
                    borderRadius: BorderRadius.circular(16.0),
                    color: Color(0xff28385e),
                    child: Tooltip(
                      message: 'Upload image from gallery',
                      child: MaterialButton(
                          padding: EdgeInsets.fromLTRB(10.0, 3.0, 10.0, 3.0),
                          onPressed: () {
                            _openMedia();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Flexible(
                                  flex: 1,
                                  fit: FlexFit.tight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child:
                                        Icon(Icons.image, color: Colors.white),
                                  )),
                              Flexible(
                                flex: 4,
                                fit: FlexFit.loose,
                                child: Text('GALLERY',
                                    textAlign: TextAlign.center,
                                    style: Styles.bodyTextStyle),
                              )
                            ],
                          )),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.1,
                  ),
                  Material(
                    elevation: 3.0,
                    borderRadius: BorderRadius.circular(16.0),
                    color: Color(0xff28385e),
                    child: Tooltip(
                      message: 'Upload image from camera',
                      child: MaterialButton(
                          padding: EdgeInsets.fromLTRB(10.0, 3.0, 10.0, 3.0),
                          onPressed: () {
                            _openMedia();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Flexible(
                                  flex: 1,
                                  fit: FlexFit.tight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Icon(Icons.camera_alt,
                                        color: Colors.white),
                                  )),
                              Flexible(
                                flex: 4,
                                fit: FlexFit.loose,
                                child: Text('CAMERA',
                                    textAlign: TextAlign.center,
                                    style: Styles.bodyTextStyle),
                              )
                            ],
                          )),
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 22.0),
                      child: Text('CANCEL',
                          textAlign: TextAlign.center,
                          style: Styles.bodyTextStyle),
                    ),
                  )
                ],
              ),
            )));
  }
}

class CustomDialogWidget extends StatefulWidget {
  final String msg;
  final bool answer;
  const CustomDialogWidget({Key key, @required this.answer, @required this.msg})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => CustomDialogWidgetState();
}

class CustomDialogWidgetState extends State<CustomDialogWidget>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;
  String get _msg => widget.msg;
  bool get _answer => widget.answer;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 350));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Center(
          child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: buildContent(MediaQuery.of(context).size.height * .35,
              MediaQuery.of(context).size.width * .65),
        ),
      )),
    );
  }

  Widget buildContent(double height, double width) {
    return Center(
        child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Container(
                width: width,
                height: height,
                padding: const EdgeInsets.fromLTRB(25.0, 5.0, 25.0, 13.0),
                margin: const EdgeInsets.fromLTRB(25.0, 16.0, 25.0, 12.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24.0),
                    boxShadow: <BoxShadow>[
                      BoxShadow(spreadRadius: 2.0, color: Colors.white)
                    ]),
                child: ListView(
                    reverse: false,
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                      SizedBox(
                        height: height * 0.08,
                      ),
                      Container(
                        height: height * 0.3,
                        margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                        child: _answer
                            ? Image.asset('assets/success.png')
                            : Image.asset('assets/error.png'),
                      ),
                      Container(
                        height: height * 0.5,
                        child: Center(
                          child: Text(
                            _msg,
                            textAlign: TextAlign.center,
                            style: Styles.subHeaderTextStyle,
                          ),
                        ),
                      )
                    ]))));
  }
}
