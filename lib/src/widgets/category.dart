import 'dart:math';

import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List colors = [Colors.red, Colors.green, Colors.blue];
  Random random = new Random();
  int ind = 0;

  @override
  Widget build(BuildContext context) {
    ind = random.nextInt(3);

    return RaisedButton(
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        color: colors[ind],
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Categoria\nT4ng4",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            )
          ],
        ));
  }
}