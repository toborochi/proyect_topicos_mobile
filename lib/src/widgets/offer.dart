import 'package:flutter/material.dart';
import 'package:proyect_topicos_mobile/src/widgets/categorywidget.dart';

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
        CategoryWidget(),
        CategoryWidget(),
        CategoryWidget(),
        CategoryWidget(),
        CategoryWidget(),
        CategoryWidget(),
        CategoryWidget(),
        CategoryWidget(),
      ],
    );
  }
}
