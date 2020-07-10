import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  ProductCard({Key key}) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      
      child: Text("Producto")
      );
  }
}