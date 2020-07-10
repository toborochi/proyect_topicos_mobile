import 'package:flutter/material.dart';
import 'package:proyect_topicos_mobile/src/widgets/category.dart';

class Offer extends StatefulWidget {
  Offer({Key key}) : super(key: key);

  @override
  _OfferState createState() => _OfferState();
}

class _OfferState extends State<Offer> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
      crossAxisCount: 2,
      children: <Widget>[
        Category(),
        Category(),
        Category(),
        Category(),
        Category(),
        Category(),
        Category(),
        Category(),
      ],
    );
  }
}
