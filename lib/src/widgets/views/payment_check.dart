import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PaymentCheck extends StatefulWidget {
  @override
  _PaymentCheckState createState() => _PaymentCheckState();
}

class _PaymentCheckState extends State<PaymentCheck> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final spinkit = SpinKitRing(
      color: Colors.white,
      size: 80.0,
    );

    return Container(
        color: Colors.green,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Verificando\nPedido",
              textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                  ),
              ),
              Container(
                height: 64,
              ),
               spinkit],
          ),
        ));
  }
}
