import 'package:flutter/material.dart';
import 'package:proyect_topicos_mobile/src/models/Category.dart';
import 'package:proyect_topicos_mobile/src/providers/category.provider.dart';
import 'package:proyect_topicos_mobile/src/widgets/categorywidget.dart';

class CategoryList extends StatefulWidget {
  CategoryList({Key key}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  void initState() {
    super.initState();
    // CategoryProvider.instance.categories;
  }

  @override
  Widget build(BuildContext context) {
    // return StreamBuilder(
    //   stream: CategoryProvider.instance.categoryStream,
    //   builder: (_, AsyncSnapshot<List<Category>> snap) {
        return Container(color: Colors.blue);
    //   },
    // );
  }

  @override
  void dispose() {
    super.dispose();
    CategoryProvider.instance.dispose();
  }
}
