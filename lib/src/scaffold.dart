import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyect_topicos_mobile/src/models/Category.dart';
import 'package:proyect_topicos_mobile/src/providers/action.provider.dart';
import 'package:proyect_topicos_mobile/src/providers/category.provider.dart';
import 'package:proyect_topicos_mobile/src/providers/dialogflow.provider.dart';
import 'package:proyect_topicos_mobile/src/providers/product.provider.dart';
import 'package:proyect_topicos_mobile/src/providers/speechProvider.dart';
import 'package:proyect_topicos_mobile/src/widgets/categorylist.dart';
// import 'package:proyect_topicos_mobile/src/widgets/category.dart';

class MyScaffold extends StatefulWidget {
  MyScaffold({Key key}) : super(key: key);

  @override
  _MyScaffoldState createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String _lastResult;
  @override
  void initState() {
    super.initState();
    SpeechRecognizer.instance.init();
    CategoryProvider.instance.categories;
    ProductProvider.instance.products;
  }

  @override
  Widget build(BuildContext context) {
    final view = Provider.of<ActionProvider>(context);

    DialogProvider.instance.init(view);
    //
    SpeechRecognizer.instance.dataStream.listen((data) {
      if (!data.status) {
        if (_lastResult != data.result) {
          DialogProvider.instance.detectIntent(_lastResult = data.result);
        }
        data.status = true;
        SpeechRecognizer.instance.dataSink(data);
        // scaffoldKey.currentState.removeCurrentSnackBar();
      }
    });
    return Scaffold(
      key: scaffoldKey,
      body: view.getWidget(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.mic),
        onPressed: () {
          try {
            SpeechRecognizer.instance.speechToText();
          } catch (err) {
            print(err);
          }
          // scaffoldKey.currentState.showSnackBar(_snackbar(context));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 5.0,
        shape: CircularNotchedRectangle(),
        color: Colors.indigo,
        child: Row(children: <Widget>[
          Expanded(
              child: SizedBox(
            height: 50,
          )),
        ]),
      ),
    );
  }

  // SnackBar _snackbar(BuildContext context) {
  //   final size = MediaQuery.of(context).size;
  //   return SnackBar(
  //     behavior: SnackBarBehavior.floating,
  //     duration: Duration(seconds: 30),
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.all(Radius.circular(15)),
  //     ),
  //     content: Container(
  //       padding: EdgeInsets.all(3),
  //       alignment: Alignment.center,
  //       height: size.height * .13,
  //       child: StreamBuilder(
  //         stream: SpeechRecognizer.instance.dataStream,
  //         builder: (_, AsyncSnapshot<SpeechData> snap) {
  //           if (snap.hasData) {
  //             return Text(
  //               snap.data.result,
  //               style: TextStyle(fontSize: 17),
  //               textAlign: TextAlign.justify,
  //               overflow: TextOverflow.fade,
  //             );
  //           }
  //           return Icon(snap.hasError ? Icons.error : Icons.record_voice_over,
  //               size: size.height * .07);
  //         },
  //       ),
  //     ),
  //   );
  // }

  @override
  void dispose() {
    super.dispose();
    DialogProvider.instance.dispose();
    SpeechRecognizer.instance.dispose();
  }
}
