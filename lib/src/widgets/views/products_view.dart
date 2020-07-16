import 'package:flutter/material.dart';
import 'package:proyect_topicos_mobile/src/models/Product.dart';
import 'package:proyect_topicos_mobile/src/widgets/product_card.dart';

class ProductsView extends StatelessWidget {
  final List<Product> products;
  const ProductsView({Key key, this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: _buildList(this.products));
  }

  List<Widget> _buildList(List<Product> data) {
    List<Widget> tmp = List<Widget>();
    data?.forEach((item) {
      tmp.add(ProductCard(
        product: item,
      ));
    });
    return tmp;
  }
}
