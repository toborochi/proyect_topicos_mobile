import 'package:flutter/material.dart';
import 'package:proyect_topicos_mobile/view/homepage.dart';
import 'package:proyect_topicos_mobile/view/offer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Barra"),),
        body: HomePage()
        )
    );
  }
}