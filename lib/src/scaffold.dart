import 'package:flutter/material.dart';
import 'package:proyect_topicos_mobile/src/providers/speechProvider.dart';
import 'package:proyect_topicos_mobile/src/widgets/views/creditcard_view.dart';
import 'package:proyect_topicos_mobile/src/providers/dialogflow.provider.dart';

class MyScaffold extends StatefulWidget {
  MyScaffold({Key key}) : super(key: key);

  @override
  _MyScaffoldState createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
  String _lastResult;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final snackbar = SnackBar(
    backgroundColor: Colors.white70,
    duration: Duration(seconds: 50),
    content: StreamBuilder(
        stream: SpeechRecognizer.instance.dataStream,
        builder: (_, AsyncSnapshot<SpeechData> snapshot) {
          print(snapshot.data?.result ?? "...sss");
          return Text(
            snapshot.data?.result ?? 'Esperando voz...',
            style: TextStyle(color: Colors.black),
            textAlign: TextAlign.right,
          );
        }),
  );

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
      print(data.result);
      if (!data.status) {
        if (_lastResult != data.result) {
          // DialogProvider.instance.detectIntent(_lastResult = data.result);
        }
        data.status = true;
        SpeechRecognizer.instance.dataSink(data);
        scaffoldKey.currentState.removeCurrentSnackBar();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("QVf8Xg4d8rM3u5yYIMScV9wJM3a2"),
        ),
        body: CreditCardView(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          child: const Icon(Icons.mic),
          onPressed: () {
            SpeechRecognizer.instance.speechToText();
            scaffoldKey.currentState.showSnackBar(snackbar);
          },
        ),
        bottomNavigationBar: BottomAppBar(
            notchMargin: 5.0,
            shape: CircularNotchedRectangle(),
            color: Colors.indigo,
            child: new Row(children: <Widget>[
              Expanded(
                  child: SizedBox(
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
