import 'package:flutter/material.dart';

import 'package:proyect_topicos_mobile/src/models/Category.dart';
import 'package:proyect_topicos_mobile/src/providers/category.provider.dart';
import 'package:proyect_topicos_mobile/src/widgets/categorywidget.dart';
import 'package:proyect_topicos_mobile/src/widgets/promo.dart';

class CategoryList extends StatefulWidget {
  CategoryList({Key key}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  void initState() {
    super.initState();
    CategoryProvider.instance.categories;
  }

  @override
  Widget build(BuildContext context) {
    CategoryProvider.instance.categories;
    return StreamBuilder(
      stream: CategoryProvider.instance.categoryStream,
      builder: (_, AsyncSnapshot<List<Category>> snap) {
        return GridView.count(
          crossAxisCount: 2,
          children: _buildList(snap?.data ?? []),
        );
      },
    );
  }

  List<Widget> _buildList(List<Category> data) {
    List<Widget> tmp = [
      Promos(), Promos(),
    ];
    data.forEach((item) => tmp.add(CategoryWidget(
          category: item,
        )));
    return tmp;
  }

  @override
  void dispose() {
    super.dispose();
    CategoryProvider.instance.dispose();
  }
}
