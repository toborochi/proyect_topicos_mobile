import 'package:flutter/material.dart';
import 'package:proyect_topicos_mobile/src/models/Order.dart';

import '../product_card_order.dart';

class OrderView extends StatelessWidget {
  final List<Item> cart;

  const OrderView({Key key, this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _buildList(context),
    );
  }

  List<Widget> _buildList(BuildContext context) {
    List<Widget> tmp = [];
    cart?.forEach((item) {
      tmp.add(ProductCardOrder(
        item: item,
      ));
    });
    if (tmp.length > 0) {
      tmp.add(_footerOrder(context));
      tmp.add(_continueBuy(context));
    }
    return tmp;
  }

  Widget _footerOrder(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.centerLeft,
        height: MediaQuery.of(context).size.height / 4,
        color: Colors.grey[300],
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  "Total",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  _amount().toStringAsFixed(2),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _continueBuy(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height / 4,
          child: ButtonTheme(
            minWidth: 200.0,
            height: 40,
            buttonColor: Colors.lightGreen,
            child: RaisedButton(
                child: Text("Continuar",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(40.0))),
          )),
    );
  }

  double _amount() {
    double tmp = 0;
    cart?.forEach((item) => tmp += item.productAmount);
    return tmp;
  }
}
