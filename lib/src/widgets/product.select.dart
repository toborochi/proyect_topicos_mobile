import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
// import 'package:fluttericon/elusive_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:proyect_topicos_mobile/src/models/Product.dart';

class ProductSelect extends StatefulWidget {
  final Product product;
  ProductSelect({Key key, this.product}) : super(key: key);

  @override
  _ProductViewState createState() => _ProductViewState(product: product);
}

class _ProductViewState extends State<ProductSelect> {
  Product product;
  int _order = 1;
  double _value;

  _ProductViewState({this.product}) {
    this._value = 1 * (1 - this.product.promo.discount / 100);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[  
              Container(
                child: CachedNetworkImage(
                  imageUrl: product.imageUrl,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              (product.promo!=null && product.promo.endDate>=DateTime.now().millisecondsSinceEpoch)?Positioned(
                  top: 16,
                  right: 16,
                  child: Stack(
                    children: <Widget>[
                      Icon(
                        FontAwesome.star,
                        size: 111,
                        color: Colors.yellow,
                      ),
                      Positioned(
                        child: Text(
                            _calcPromo(product.promo.discount * 100) + "%", 
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 19)),
                        top: 47,
                        right: 36,
                      ),
                    ],
                  )):Container()
            ],
          ),
          Container(
            child: _productInfo(),
            padding: EdgeInsets.fromLTRB(30, 20, 30, 10),
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  String _calcPromo(double p) {
    int pint = p.toInt();
    return pint.toString();
  }

  Widget _productInfo() {
    return Column(children: <Widget>[
      Container(
        child: Text(
          product.name,
          style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
        ),
        alignment: Alignment.topLeft,
      ),
      SizedBox(
        height: 5,
      ),
      Container(
        alignment: Alignment.topLeft,
        child: Text(
          product.description,
          textAlign: TextAlign.left,
          maxLines: 10,
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      ),
      SizedBox(height: 5),
      Container(
        alignment: Alignment.topLeft,
        child: Text(
          "Stock : " + product.stock.toString(),
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ),
      // SizedBox(height: 5),
      Container(
        alignment: Alignment.topLeft,
        child: Text(
          "Bs " + product.price.toString(),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
        ),
      ),
      SizedBox(height: 5),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FloatingActionButton(
            child: Icon(Icons.remove),
            backgroundColor: Colors.orange,
            onPressed: () => setState(() {
              _order -= _order > 1 ? 1 : 0;
              _value =
                  _order * product.price * (1 - product.promo.discount / 100);
            }),
          ),
          SizedBox(
            width: 15,
          ),
          Container(
            child: Text(
              "$_order",
              style: TextStyle(
                fontSize: 29,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          FloatingActionButton(
              child: Icon(Icons.add),
              backgroundColor: Colors.orange,
              onPressed: () => setState(() {
                    _order += _order < product.stock ? 1 : 0;
                    _value = _order *
                        product.price *
                        (1 - product.promo.discount / 100);
                  })),
        ],
      ),
      Container(
        margin: EdgeInsets.only(top: 15, left: 5),
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        child: Center(
          child: Text(
            _value.toStringAsFixed(2) + "Bs",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        height: 80,
        width: 120,
      ),
    ]);
  }
}
