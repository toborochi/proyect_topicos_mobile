import 'package:flutter/material.dart';
import 'package:proyect_topicos_mobile/src/providers/dialogflow.provider.dart';
import 'package:proyect_topicos_mobile/src/providers/speechProvider.dart';
import 'package:proyect_topicos_mobile/src/widgets/views/homepage.dart';

class MyScaffold extends StatefulWidget {
  MyScaffold({Key key}) : super(key: key);

  @override
  _MyScaffoldState createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
  @override
  void initState() {
    super.initState();
    DialogProvider.instance.init();
    SpeechRecognizer.instance.init();
    this._addListeners();
  }

  _addListeners() {
    DialogProvider.instance.responseStream.listen((res) {
      print(res.queryResult.fulfillmentText);
    });

    SpeechRecognizer.instance.dataStream.listen((data) {
      if (!data.status) {
        print(data.result);
        data.status = true;
        SpeechRecognizer.instance.dataSink(data);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("QVf8Xg4d8rM3u5yYIMScV9wJM3a2"),
        ),
        body: HomePage(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          child: const Icon(Icons.mic),
          onPressed: () {
            SpeechRecognizer.instance.speechToText();
          },
        ),
        bottomNavigationBar: new BottomAppBar(
            notchMargin: 5.0,
            shape: CircularNotchedRectangle(),
            color: Colors.grey,
            child: new Row(children: <Widget>[
              Expanded(
                  child: new SizedBox(
                height: 50,
              )),
            ])));
  }

  @override
  void dispose() {
    super.dispose();
    DialogProvider.instance.dispose();
    SpeechRecognizer.instance.dispose();
  }
}
