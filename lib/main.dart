import 'package:flutter/material.dart';
import 'package:proyect_topicos_mobile/src/widgets/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text("QVf8Xg4d8rM3u5yYIMScV9wJM3a2"),
            ),
            body: HomePage(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.black,
              child: const Icon(Icons.mic),
              onPressed: () {},
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
                ]))));
  }
}
