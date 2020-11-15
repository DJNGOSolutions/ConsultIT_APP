import 'package:consult_it_app/bloc/home_bloc.dart';
import 'package:consult_it_app/events/home_events.dart';
import 'package:consult_it_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:consult_it_app/utils/widgets_lib.dart' as myWidgets;

class ConsultantsListPage extends StatelessWidget {
  final String heroTag, imgPath, optionName;
  final HomeBloc homeBloc;

  const ConsultantsListPage(
      {Key key,
      @required this.heroTag,
      @required this.imgPath,
      @required this.optionName,
      @required this.homeBloc})
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
          child: ListView(
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
                              image: AssetImage(imgPath), fit: BoxFit.contain),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Text(optionName, style: Styles.headerTextStyle),
                    )
                  ],
                ),
                SizedBox(height: 10.0),
                myWidgets.staffItem(
                    staffName: 'Ronald Vega',
                    staffPosition: 'IT Manager',
                    staffNumber: '123 456 7890',
                    imgPath:
                        'https://content.thriveglobal.com/wp-content/uploads/2018/12/profile21.jpg',
                    context: context,
                    bloc: homeBloc),
                myWidgets.staffItem(
                    staffName: 'Salvador Vega',
                    staffPosition: 'General Manager',
                    staffNumber: '301 323 3213',
                    imgPath:
                        'https://qph.fs.quoracdn.net/main-raw-133532646-cuvvxaqssfswoftefsrernglbshzowfp.jpeg',
                    context: context,
                    bloc: homeBloc),
                myWidgets.staffItem(
                    staffName: 'Julio',
                    staffPosition: 'Staff Position',
                    staffNumber: 'Staff Number',
                    imgPath:
                        'https://www.surrey.ac.uk/sites/default/files/styles/600x450_4_3/public/2018-02/leo-blanchard-student-graduate-profile.jpg',
                    context: context,
                    bloc: homeBloc),
                myWidgets.staffItem(
                    staffName: 'Juan',
                    staffPosition: 'Staff Position',
                    staffNumber: 'Staff Number',
                    imgPath:
                        'https://cdn.vox-cdn.com/thumbor/wI3iu8sNbFJSQB4yMLsoPMNzIHU=/0x0:3368x3368/1200x800/filters:focal(1188x715:1726x1253)/cdn.vox-cdn.com/uploads/chorus_image/image/62994726/AJ_Finn_author_photo_color_photo_courtesy_of_the_author.0.jpg',
                    context: context,
                    bloc: homeBloc),
                myWidgets.staffItem(
                    staffName: 'Jose',
                    staffPosition: 'Staff Position',
                    staffNumber: 'Staff Number',
                    imgPath:
                        'https://46svmh2eidr34ea1z715q5mm-wpengine.netdna-ssl.com/wp-content/uploads/Galbraith-3web-cropped-small.jpg',
                    context: context,
                    bloc: homeBloc),
                myWidgets.staffItem(
                    staffName: 'Eduardo',
                    staffPosition: 'Staff Position',
                    staffNumber: 'Staff Number',
                    imgPath:
                        'https://res.cloudinary.com/twenty20/private_images/t_watermark-criss-cross-10/v1442027779000/photosp/a4098098-a065-4734-8683-6d12b05e3006/stock-photo-portrait-men-profile-beard-a4098098-a065-4734-8683-6d12b05e3006.jpg',
                    context: context,
                    bloc: homeBloc),
                SizedBox(
                  height: 40.0,
                )
              ]),
        ));
  }
}
