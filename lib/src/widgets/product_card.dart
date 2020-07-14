import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class ProductCard extends StatefulWidget {
  ProductCard({Key key}) : super(key: key);

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
                        Text("Item",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                        Text("Descripcion del producto"),
                        Text("Stock: 20"),
                        Text("40Bs.",
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
                        child: FadeInImage.memoryNetwork(height: 100,placeholder: kTransparentImage,  image: 'https://pbs.twimg.com/profile_images/609439993094770690/MqfzEbtj.jpg')
                      ),
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
