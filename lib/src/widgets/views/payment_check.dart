import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:proyect_topicos_mobile/src/models/Order.dart';
import 'package:proyect_topicos_mobile/src/providers/orderProvider.dart';
import 'package:proyect_topicos_mobile/src/providers/action.provider.dart';
import 'package:provider/provider.dart';


class PaymentCheck extends StatefulWidget {


  String paymentID;

  PaymentCheck(this.paymentID);

  @override
  _PaymentCheckState createState() => _PaymentCheckState();
}

class _PaymentCheckState extends State<PaymentCheck> {
  @override
  Widget build(BuildContext context) {

    final spinkit = SpinKitRing(
      color: Colors.white,
      size: 80.0,
    );

    final p = Provider.of<ActionProvider>(context).getOrder();

    checkData(p).then((value) {
        // ACA VA EL PUSH DE LA VISTA
        if(value){
            print("TRUE");
        }else{
            print("FALSE");
        }
    });

    return Container(
        color: Colors.green,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Verificando\nPedido",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                height: 64,
              ),
              spinkit
            ],
          ),
        ));
  }

  Future<bool> checkData(dynamic o) async {
    final Map<String,dynamic> res = await OrderProvider.instance.saveOrder(o);
    if(res["orderId"]!=null){
      return true;
    }
    return false;
  }
}
