import 'package:flutter/material.dart';
import 'package:proyect_topicos_mobile/src/widgets/product_card.dart';

class ProductsView extends StatefulWidget {
  @override
  _ProductsViewState createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
        ProductCard(),
        ProductCard(),
        ProductCard(),
        ProductCard(),
        ProductCard(),
    ],);
  }
}