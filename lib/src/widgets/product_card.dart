import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:proyect_topicos_mobile/src/models/Product.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductCard extends StatefulWidget {
  final Product product;

  ProductCard({Key key, this.product}) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.fromLTRB(10, 4.0, 10, 4.0),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: InkWell(
            onTap: () {},
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(this.widget.product.name, // NOMBRE PREDUCTO
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                        Text(this.widget.product.description,
                            style: TextStyle(fontSize: 12)), //  DESCRIPCION
                        Text('Stock: ' +
                            this.widget.product.stock.toString()), // STOCK
                        Text(
                            'Precio: ' +
                                this.widget.product.price.toString(), // PRECIO
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Stack(
                    children: <Widget>[
                      ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: FadeInImage.memoryNetwork(
                              height: 100,
                              placeholder: kTransparentImage,
                              image: this.widget.product.imageUrl)),
                      Positioned(
                        right: 5,
                        top: 5,
                        child: new Icon(
                          FontAwesome.star,
                          color: Colors.orange,
                          size: 32,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
