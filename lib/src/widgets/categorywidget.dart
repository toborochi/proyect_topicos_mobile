import 'dart:math';

import 'package:flutter/material.dart';
import 'package:proyect_topicos_mobile/src/models/Category.dart';

class CategoryWidget extends StatelessWidget {
  final Category category;
  const CategoryWidget({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List colors = [Colors.red, Colors.green, Colors.blue];
    Random random = new Random();
    int ind = 0;
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
              category.name,
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
