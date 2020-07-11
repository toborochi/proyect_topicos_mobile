import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  ProductCard({Key key}) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
      onTap: () {},
      child: ListTile(
        trailing: Container(
            margin: EdgeInsets.all(5),
            child: Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    'https://i.pinimg.com/originals/ae/7a/4f/ae7a4f7761d08b346d075ee9d39343bd.jpg',
                    height: 400.0,
                  ),
                ),
                Positioned(
                  right: 0.0,
                  top: 0.0,
                  child: new Icon(
                    Icons.star,
                    color: Colors.orange,
                  ),
                ),
              ],
            )),
        title: Text("PRODUCTO"),
      ),
    ));
  }
}
