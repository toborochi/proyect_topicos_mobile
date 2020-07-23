import 'package:flutter/material.dart';
// import 'package:fluttericon/brandico_icons.dart';
// import 'package:fluttericon/elusive_icons.dart';
// import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
// import 'package:fluttericon/maki_icons.dart';
// import 'package:fluttericon/octicons_icons.dart';
// import 'package:fluttericon/zocial_icons.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          color: Colors.deepOrangeAccent,
          height: 120,
          padding: EdgeInsets.all(20),
          child: Row(
            children: <Widget>[
              Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80),
                      border: Border.all(
                          width: 3,
                          color: Colors.white,
                          style: BorderStyle.solid)),
                  child: Icon(
                    FontAwesome.user,
                    color: Colors.white,
                    size: 32,
                  )),
              Spacer(),
              Text(
                "Hola Pedro!",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
        ListTile(
          title: Text("Datos Personales"),
          trailing: Icon(Icons.chevron_right),
        ),
        ListTile(
          title: Text("Datos de Pago"),
          trailing: Icon(Icons.chevron_right),
        ),
        ListTile(
          title: Text("Direccion"),
          trailing: Icon(Icons.chevron_right),
        ),
        Container(
          color: Colors.grey[200],
          padding: EdgeInsets.all(8),
          child: Text("Mas información"),
        ),
        ListTile(
          title: Text("FAQ"),
          trailing: Icon(Icons.chevron_right),
        ),
        ListTile(
          title: Text("Términos y Condiciones"),
          trailing: Icon(Icons.chevron_right),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 40),
          child: RaisedButton(
              color: Colors.lightGreen,
              child: Text("Cerrar Sesión",
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
