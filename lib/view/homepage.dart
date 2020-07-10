import 'package:flutter/material.dart';
import 'package:proyect_topicos_mobile/view/category.dart';
import 'package:proyect_topicos_mobile/view/offer.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
        Expanded(
          child: Offer(),)
    ],);
  }
}
