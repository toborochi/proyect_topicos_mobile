import 'package:flutter/material.dart';

import 'package:fluttericon/font_awesome_icons.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:proyect_topicos_mobile/src/models/Product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({Key key, this.product}) : super(key: key);

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
                        Text(this.product.name, // NOMBRE PREDUCTO
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                        Text(this.product.description,
                            style: TextStyle(
                              fontSize: 12,
                            )), //  DESCRIPCION
                        Text('Stock: ${this.product.stock}'), // STOCK
                        Text('Precio: ${this.product.price}', // PRECIO
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
                      //
                      ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: FadeInImage.memoryNetwork(
                              height: 100,
                              placeholder: kTransparentImage,
                              image: this.product.imageUrl)),
                      //
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
