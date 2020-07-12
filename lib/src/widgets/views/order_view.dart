import 'package:flutter/material.dart';
import 'package:proyect_topicos_mobile/src/product_card_order.dart';

class OrderView extends StatefulWidget {
  @override
  _OrderViewState createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ProductCardOrder(),
        ProductCardOrder(),
        ProductCardOrder(),
        ProductCardOrder(),
        Align(
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      "Bs. 20",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Align(
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
        ),
      ],
    );
  }
}
