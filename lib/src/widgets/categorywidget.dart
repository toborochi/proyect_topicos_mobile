import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
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
    return InkWell(
          onTap: (){},
          child: Container(
            padding: EdgeInsets.all(4),
          color: colors[ind],
          child: Stack(
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: category.imageUrl,
                  width: double.infinity,
                  fit: BoxFit.fill,
              )
            ],
          )),
    );
  }
}
