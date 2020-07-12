import 'package:flutter/material.dart';

class PayPalView extends StatefulWidget {
  @override
  _PayPalViewState createState() => _PayPalViewState();
}

class _PayPalViewState extends State<PayPalView> {

  TextEditingController email;
  TextEditingController password;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
          controller: email,

        ),
        ButtonTheme(
          minWidth: 300,
          height: 60,
          child: RaisedButton(
              color: Colors.lightGreen,
              child: Text("Continuar",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(40.0))),
        ),
      ],
    );
  }
}
