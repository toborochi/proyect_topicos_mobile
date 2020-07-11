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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
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
                        'https://pbs.twimg.com/profile_images/609439993094770690/MqfzEbtj.jpg',
                        height: 200.0,
                      ),
                    ),
                    Positioned(
                      right: 0.0,
                      top: 0.0,
                      child: new Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 32,
                      ),
                    ),
                  ],
                )),
            title: Text(
              "Item",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Detalle del Producto, blah blah blah"),
                Text(
                  "Stock: 20",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  "26 Bs.",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                )
              ],
            ),
          ),
        ));
  }
}
