import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyect_topicos_mobile/src/providers/action.provider.dart';
import 'package:proyect_topicos_mobile/src/widgets/views/payment_check.dart';
import 'package:proyect_topicos_mobile/src/widgets/views/payment_view.dart';

class PaymentList extends StatefulWidget {
  final String uid;
  final List paymentsMethods;
  PaymentList({Key key, this.uid, this.paymentsMethods}) : super(key: key);

  @override
  _PaymentListState createState() => _PaymentListState();
}

class _PaymentListState extends State<PaymentList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: _buildList(context, this.widget.paymentsMethods),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.payment),
        backgroundColor: Colors.green,
        onPressed: () {
          Provider.of<ActionProvider>(context,listen: false).setPage(PaymentView(
            uid: this.widget.uid,
          ));
        },
      ),
    );
  }

  List<Widget> _buildList(BuildContext context, List data) {
    List<Widget> tmp = List();
    data?.forEach((item) {
      tmp.add(item.containsKey("email")
          ? ListTile(
              title: Text(item["email"]), subtitle: Text(item["password"]),
              onTap: () {
                Provider.of<ActionProvider>(context,listen: false).setPage(PaymentCheck());
              },
              )
          : ListTile(
              title: Text(item["cardNumber"]),
              subtitle: Text(item["expiryDate"]),
              onTap: () {
                Provider.of<ActionProvider>(context,listen: false).setPage(PaymentCheck());
              },
            ));
    });
    return tmp;
  }
}
