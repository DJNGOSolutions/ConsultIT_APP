import 'package:consult_it_app/models/faqmessage_model.dart';
import 'package:consult_it_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../utils/widgets_lib.dart' as myWidgets;

class FaqBotPage extends StatefulWidget {
  @override
  _FaqBotPageState createState() => _FaqBotPageState();
}

class _FaqBotPageState extends State<FaqBotPage> {
  final List<FAQMessage> _messages = <FAQMessage>[];
  final TextEditingController _messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.mainColor,
        title: Text('Consult It'),
      ),
      body: Column(
        children: [
          Flexible(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
              child: ListView.builder(
                itemBuilder: (_, int index) => myWidgets.faqMessage(
                    context: context, message: _messages[index]),
                itemCount: _messages.length,
              ),
            ),
          ),
          Divider(
            height: 1,
          ),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: _queryInputWidget(context),
          )
        ],
      ),
    ));
  }

  Widget _queryInputWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              controller: _messageController,
              onSubmitted: _submitQuery,
              decoration: InputDecoration.collapsed(hintText: "Send a message"),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4.0),
            child: IconButton(
                tooltip: "Enviar mensaje",
                icon: Icon(
                  Icons.send,
                  color: MyColors.accentColor,
                ),
                onPressed: () => _submitQuery(_messageController.text)),
          ),
        ],
      ),
    );
  }

  void _submitQuery(String text) {
    _messageController.clear();
    if (text == null || text.replaceAll(" ", "") == "") {
      Fluttertoast.showToast(
          msg: "El mensaje no puede estar vacío", fontSize: 16);
    } else {
      FAQMessage faqMessage =
          new FAQMessage(message: text, sender: "Ronald Vega", type: true);
      setState(() {
        _messages.add(faqMessage);
      });
      _dialogFlowResponse(text);
    }
  }

  void _dialogFlowResponse(query) async {
    _messageController.clear();
    AuthGoogle authGoogle = await AuthGoogle(
            fileJson: "assets/faq-bot/consultit-faqbot-xtwp-0472b6f8e6f9.json")
        .build();
    Dialogflow dialogflow = Dialogflow(
        authGoogle: authGoogle, language: Language.spanishLatinAmerica);
    print('Dialogflow: ${dialogflow.authGoogle.fileJson}');
    AIResponse response = await dialogflow.detectIntent(query);
    FAQMessage message = FAQMessage(
        message: response.getMessage() ??
            CardDialogflow(response.getListMessage()[0]).title,
        sender: "Consult-IT",
        type: false);
    setState(() {
      _messages.add(message);
    });
  }
}
