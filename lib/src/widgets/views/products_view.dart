import 'package:flutter/material.dart';
import 'package:proyect_topicos_mobile/src/models/Product.dart';
import 'package:proyect_topicos_mobile/src/providers/product.provider.dart';
import 'package:proyect_topicos_mobile/src/widgets/product_card.dart';

class ProductsView extends StatefulWidget {

  final Stream<List<Product>> s;
  ProductsView({this.s});

  @override
  _ProductsViewState createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  
  List<Widget> _buildList(List<Product> data) {
    List<Widget> tmp = List<Widget>();
    data.forEach((item) => tmp.add(ProductCard(
          product: item,
        )));
    return tmp;
  }

  @override
  void initState() {
    super.initState();
    ProductProvider.instance.byPromo;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: this.widget.s,
      builder: (_, AsyncSnapshot<List<Product>> snapshot) {
        return ListView(children: _buildList(snapshot?.data ?? []));
      },
    );
  }
}
