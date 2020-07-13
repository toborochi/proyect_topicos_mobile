import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';

class PayPalView extends StatefulWidget {
  @override
  _PayPalViewState createState() => _PayPalViewState();
}

class _PayPalViewState extends State<PayPalView> {
  TextEditingController email;
  TextEditingController password;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20,),
          Icon(FontAwesome.paypal,color: Colors.blue[900],size: 40,),
          SizedBox(height: 20,),
          TextField(
            decoration: InputDecoration(
              hintText: 'email',
              prefixIcon: Icon(Icons.email),
              hintStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.white70,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: Colors.grey, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: Colors.blue, width: 1),
              ),
            ),
          ),
          SizedBox(height: 20,),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'password',
              prefixIcon: Icon(Icons.lock),
              hintStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.white70,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: Colors.grey, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: Colors.blue, width: 1),
              ),
            ),
          ),
          SizedBox(height: 20,),
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
      ),
    );
  }
}
