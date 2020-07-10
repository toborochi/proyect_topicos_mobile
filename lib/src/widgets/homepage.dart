import 'package:flutter/material.dart';
import 'package:proyect_topicos_mobile/src/widgets/offer.dart';
import 'package:proyect_topicos_mobile/widgets/promo.dart';


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
