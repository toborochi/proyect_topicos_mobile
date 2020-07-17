import 'package:flutter/material.dart';
import 'package:proyect_topicos_mobile/src/models/Order.dart';
// import 'package:proyect_topicos_mobile/src/widgets/product_card.dart';
import 'package:proyect_topicos_mobile/src/widgets/product_card_order.dart';

class OrderDetail extends StatelessWidget {
  final Order order;
  const OrderDetail({Key key, this.order}) : super(key: key);

  double _total() {
    double tmp = 0;
    order.item?.forEach((item) => tmp += item.productAmount);
    return tmp;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
              width: 300,
              decoration: BoxDecoration(
                color: Colors.orange[900],
              borderRadius: BorderRadius.only(topRight:  Radius.circular(40),bottomRight:Radius.circular(40) ),
              border: Border.all(width: 3,color: Colors.orange[900],style: BorderStyle.solid)
              ),
              child: Center(child: Text("Detalle del Pedido",style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),)),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            color: Colors.grey[200],
            height: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                  

                Text("Detalle de Pedido",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Forma de Pago",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Text("Tarjeta",style: TextStyle(fontSize: 16)),
                      SizedBox(height: 10,),
                      Text("CI/NIT",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Text("6228811",style: TextStyle(fontSize: 16)),
                      SizedBox(height: 10,),
                      Text("Direccion",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Text("Calle los pinos",style: TextStyle(fontSize: 16)),
                      SizedBox(height: 10,),
                      Text("Referencia",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Text("787845454",style: TextStyle(fontSize: 16)),
                    ],
                  ),
                )
              ],
            ),
          ),
          Column(children: _buildList(order.item),),
          Container(
            padding: EdgeInsets.all(16),
            color: Colors.grey[300],
            height: 50,
            child: Row(
              children: <Widget>[
                Text("Total: "),
                Spacer(),
                Text("Bs. ${_total()}")
              ],
            )
          )
        ],
      ),
    );
  }


  List<Widget> _buildList(List<Item> data) {
    List<Widget> tmp = List<Widget>();
    data?.forEach((item) {
      tmp.add(ProductCardOrder(
        item: item,
      ));
    });
    return tmp;
  }

}
