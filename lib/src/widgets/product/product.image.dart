import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String url;
  const ProductImage({Key key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CachedNetworkImage(
      imageUrl: url,
      height: size.height * .25,
      width: double.infinity,
      fit: BoxFit.fill,
    );
  }
}
