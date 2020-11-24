import 'package:consult_it_app/bloc/home_bloc.dart';
import 'package:consult_it_app/events/home_events.dart';
import 'package:consult_it_app/models/entrepreneur_model.dart';
import 'package:consult_it_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:consult_it_app/utils/widgets_lib.dart' as myWidgets;
import 'package:im_stepper/stepper.dart';

class AnalyzeBusinessPage extends StatefulWidget {
  final HomeBloc homeBloc;
  final Entrepreneur entrepreneur;
  final String optionName, heroTag;

  const AnalyzeBusinessPage(
      {Key key,
      @required this.homeBloc,
      @required this.entrepreneur,
      @required this.optionName,
      @required this.heroTag})
      : super(key: key);
  @override
  _AnalyzeBusinessPageState createState() => _AnalyzeBusinessPageState();
}

class _AnalyzeBusinessPageState extends State<AnalyzeBusinessPage> {
  HomeBloc get homeBloc => widget.homeBloc;
  Entrepreneur get entrepreneur => widget.entrepreneur;
  int number = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myWidgets.customAppBar(
          context: context,
          canGoBack: true,
          function: () => homeBloc
              .add(ToMyBusinessesList(businesses: entrepreneur.businesses))),
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
                SizedBox(height: 15.0),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    'El análisis de Valor Presente Neto, representa los estados de flujos de efectivo con todas tus actividades financieras, esto nos servirá para determinar si tu negocio es una inversión aceptable o no.',
                    style:
                        Styles.bodyTextStyleNonBold.apply(fontSizeFactor: 0.96),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    'Para este caso realizaremos el analisis de VPN (Valor Presente Neto) haremos una proyeccion a 5 años. Para construir este análisis requerimos que ingreses todas las entradas y salidas de efectivo asociadas con tu negocio.',
                    style:
                        Styles.bodyTextStyleNonBold.apply(fontSizeFactor: 0.96),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    'Así mismo requerimos que ingreses la Tasa de Interés de Retorno, es decir el porcentaje de utilidad que esperas alcanzar. ',
                    style:
                        Styles.bodyTextStyleNonBold.apply(fontSizeFactor: 0.96),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: NumberStepper(
                    onStepReached: (index) => {
                      setState(() {
                        number = index;
                        print(number.toString());
                      })
                    },
                    stepReachedAnimationDuration: Duration(milliseconds: 600),
                    activeStepColor: MyColors.mainColor,
                    stepRadius: 20.0,
                    numbers: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],
                    direction: Axis.horizontal,
                    numberStyle:
                        Styles.bodyTextStyleNonBold.apply(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                _showAnalyzeList(number),
              ])),
    );
  }

  Widget _showAnalyzeList(int number) {
    switch (number) {
      case 0:
        return myWidgets.stepperContainer(
            title: 'Ingresos ',
            content:
                'Los ingresos percibidos en el año correspondiente. \nTodo ingreso en valor monetario',
            context: context);
        break;
      case 1:
        return myWidgets.stepperContainer(
            title: 'Mano de Obra ',
            content:
                'Costo de la Mano de Obra requerida para la operaciones outsourcing de la empresa. Es decir, todos las contrataciones externas a planilla',
            context: context);
        break;
      case 2:
        return myWidgets.stepperContainer(
            title: 'Materiales ',
            content:
                'Costo totales de los materiales requeridos para la operación de la empresa a lo largo del año correspondiente.',
            context: context);
        break;
      case 3:
        return myWidgets.stepperContainer(
            title: 'Gastos Indirectos ',
            content: ' Cualquier costo no contemplado anteriormente.',
            context: context);
        break;
      case 4:
        return myWidgets.stepperContainer(
            title: 'Depreciacion ',
            content:
                'La depreciación de los activos fijos hace referencia a la maquinaria de la empresa. Para este calculo se toma en cuenta el valor inicial de la maquinaria y se divide entre los años de vida util del mismo.',
            context: context);
        break;
      case 5:
        return myWidgets.stepperContainer(
            title: 'Intereses ',
            content:
                'Ingrese el total a cancelar al final del año en cuestion de prestamos activos.',
            context: context);
        break;
      case 6:
        return myWidgets.stepperContainer(
            title: 'Capital de Trabajo ',
            content: 'Costo del capital de trabajo.',
            context: context);
        break;
      case 7:
        return myWidgets.stepperContainer(
            title: 'Recuperación C-T ',
            content:
                'Recuperación del capital de trabajo, es decir salarios de planilla.',
            context: context);
        break;
      case 8:
        return myWidgets.stepperContainer(
            title: 'Inversión acción ',
            content: 'Inversión inicial de la empresa.',
            context: context);
        break;
      case 9:
        return myWidgets.stepperContainer(
            title: 'Inversión deuda ',
            content: 'Si existe un préstamo inicial.',
            context: context);
        break;
      case 10:
        return myWidgets.stepperContainer(
            title: 'Pago capital ',
            content: 'Pagos anuales del préstamo inicial',
            context: context);
        break;
      case 11:
        return myWidgets.stepperContainer(
            title: 'Valor de rescate ',
            content:
                'Valor de los activos de la empresa si se vendieran. Se calcula en base al valor de los activos al final de su vida util (En este caso al final de 5 años, ya que el estudio es en proyeccion a 5 años).',
            context: context);
        break;
      default:
        return myWidgets.stepperContainer(
            title: 'ConsultIT',
            content: 'Gracias por utilizar ConsultIT',
            context: context);
    }
  }
}
