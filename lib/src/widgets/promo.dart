import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Promos extends StatefulWidget {
  Promos({Key key}) : super(key: key);

  @override
  _PromosState createState() => _PromosState();
}

class _PromosState extends State<Promos> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: SizedBox.expand(
          child: InkWell(
            child: Container(
              color: Colors.grey[200],
              padding: EdgeInsets.all(6),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  CachedNetworkImage(
                      imageUrl:
                          "https://image.freepik.com/free-vector/happy-cute-smiling-funny-5-stars-hand-flat-cartoon-character-illustration-icon-isolated-white-cute-kawaii-character-five-stars-customer-product-rating-review_92289-544.jpg",
                      placeholder: (context, url) {
                        return Center(
                            child: Image.asset('assets/catLoading.gif'));
                      },
                      width: double.infinity,
                      fit: BoxFit.scaleDown),
                  Container(
                    padding: EdgeInsets.fromLTRB(0,0, 0, 32),
                    child: Text(
                      "Promociones",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {},
          ),
        ),
        height: MediaQuery.of(context).size.width * 0.6);
  }
}
