import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductSelect extends StatefulWidget {
  ProductSelect({Key key}) : super(key: key);

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductSelect> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: Column(
        children: <Widget>[
          offerDate( date: "11/07/2020"),
        ],
      ),
    );
  }

  Row offerDate({String date}) {
    return Row(children: <Widget>[
      Icon(
        Icons.date_range,
        color: Colors.grey[100],
      ),
      SizedBox(width: 10),
      Text(date)
    ]);
  }
}
