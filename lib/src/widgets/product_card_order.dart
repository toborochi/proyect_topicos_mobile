import 'package:flutter/material.dart';

import 'package:proyect_topicos_mobile/src/models/Order.dart';

class ProductCardOrder extends StatelessWidget {
  final Item item;
  const ProductCardOrder({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(10, 8.0, 10, 8.0),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Text("${item.productQuantity}"),
                Container(
                  width: 10,
                ),
                Text("${item.name}",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Spacer(),
                Text("${item.productAmount}",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Icon(
                  Icons.star,
                  size: 40,
                  color: Colors.orange,
                )
              ],
            ),
          )),
    );
  }

  


}
