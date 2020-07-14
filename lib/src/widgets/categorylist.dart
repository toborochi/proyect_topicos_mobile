import 'package:flutter/material.dart';
import 'package:proyect_topicos_mobile/src/widgets/categorywidget.dart';

class CategoryList extends StatefulWidget {
  CategoryList({Key key}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
      crossAxisCount: 2,
      children: <Widget>[
        CategoryWidget(),
        CategoryWidget(),
        CategoryWidget(),
        CategoryWidget(),
        CategoryWidget(),
        CategoryWidget(),
        CategoryWidget(),
        CategoryWidget(),
      ],
    );
  }
}
