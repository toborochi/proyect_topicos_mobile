import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:proyect_topicos_mobile/src/models/Order.dart';
import 'package:proyect_topicos_mobile/src/models/Payment.dart';
import 'package:proyect_topicos_mobile/src/providers/orderProvider.dart';
import 'package:proyect_topicos_mobile/src/providers/action.provider.dart';

import 'package:provider/provider.dart';
import 'package:proyect_topicos_mobile/src/providers/paymentMethod.provider.dart';
import 'package:proyect_topicos_mobile/src/widgets/views/order_detail_view.dart';
import 'package:proyect_topicos_mobile/src/widgets/views/order_view.dart';


class PaymentCheck extends StatefulWidget {
  final String paymentID;
  final String typePayment;
  final dynamic payment;
  PaymentCheck({this.paymentID,this.payment,this.typePayment});

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

    var prov = Provider.of<ActionProvider>(context);
    Order p = prov.getOrder();

    checkData(p).then((value) async {
        // ACA VA EL PUSH DE LA VISTA
        if(value.isNotEmpty){
            await PaymentProvider.instance.createPayment(
                Payment(
                  amount: p.amount,
                  date: DateTime.now().millisecondsSinceEpoch,
                  orderId: value,
                  paymetMethodId: this.widget.paymentID,
                  description: "Comprando un Item",
                  bill: Bill(
                        amount: p.amount,
                        dateEmission: DateTime.now().millisecondsSinceEpoch,
                        description: "Item Comprado"
                  )
                )
            );

              /*
              if(this.widget.typePayment=="card"){
                await PaymentProvider.instance.stripePayment(this.widget.payment);
              }else{
                await PaymentProvider.instance.paypalPayment(this.widget.payment);
              }*/
            
            // Cambiar Vista a Detalles del pedido
            prov.setPage(OrderDetail(order: p,));
            
        }else{
            prov.setPage(OrderView(cart: p.item,));
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

  Future<String> checkData(dynamic o) async {
    final Map<String,dynamic> res = await OrderProvider.instance.saveOrder(o);
    if(res["orderId"]!=null){
      return res["orderId"];
    }
    return "";
  }

}
