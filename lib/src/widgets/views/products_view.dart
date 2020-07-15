import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyect_topicos_mobile/src/models/Product.dart';
import 'package:proyect_topicos_mobile/src/providers/action.provider.dart';
import 'package:proyect_topicos_mobile/src/widgets/product_card.dart';

class ProductsView extends StatefulWidget {
  final List<Product> products;
  ProductsView({this.products});
  @override
  _ProductsViewState createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  @override
  Widget build(BuildContext context) {
    final view = Provider.of<ActionProvider>(context);
    if (this.widget.products == null) {
      return StreamBuilder(
        stream: view.getProvider(),
        builder: (_, AsyncSnapshot<List<Product>> snapshot) {
          return ListView(children: _buildList(snapshot.data));
        },
      );
    } else {
      return ListView(children: _buildList(this.widget.products));
    }
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
