import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:proyect_topicos_mobile/src/models/Category.dart';

class CategoryWidget extends StatelessWidget {
  final Category category;
  const CategoryWidget({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
          padding: EdgeInsets.all(4),
          color: Color(0xE7DFDD),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              _productImage(),
              Text(
                category.name,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ],
          )),
    );
  }

  Widget _productImage() {
    return category.imageUrl == null
        ? Image(image: AssetImage('assets/notFound.jpg'))
        : CachedNetworkImage(
            imageUrl: category.imageUrl,
            placeholder: (context, url) {
              return Center(child: Image.asset('assets/catLoading.gif'));
            },
            width: double.infinity,
            fit: BoxFit.scaleDown);
  }
}
