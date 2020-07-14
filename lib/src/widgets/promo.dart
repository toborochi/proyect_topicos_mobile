import 'package:flutter/material.dart';

class Promos extends StatefulWidget {
  Promos({Key key}) : super(key: key);

  @override
  _PromosState createState() => _PromosState();
}

class _PromosState extends State<Promos> {
  @override
  Widget build(BuildContext context) {
    return 
    Container(
        width: double.infinity,
        child: SizedBox.expand(
          child: RaisedButton(
            child: Text(
              "Promos",
              style: TextStyle(fontSize: 40),
            ),
            onPressed: () {},
          ),
        ),
        height: MediaQuery.of(context).size.width * 0.6);
  }
}
