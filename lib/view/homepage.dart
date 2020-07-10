import 'package:flutter/material.dart';
import 'package:proyect_topicos_mobile/view/category.dart';
import 'package:proyect_topicos_mobile/view/offer.dart';
import 'package:proyect_topicos_mobile/view/promo.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        Promos(),
        Offer()
      ],
    );
  }
}
