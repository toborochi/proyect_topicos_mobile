import 'package:flutter/material.dart';

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
        children: _buildList(this.widget.paymentsMethods),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.payment),
          backgroundColor: Colors.green,
          onPressed: () {
            Navigator.pushNamed(context, 'paymentMethod');
          }),
    );
  }

  List<Widget> _buildList(List data) {
    List<Widget> tmp = List();
    data?.forEach((item) {
      if (item.containsKey("email")) {
        tmp.add(ListTile(
          title: Text(item["email"]),
          subtitle: Text(item["password"]),
        ));
      } else {
        tmp.add(ListTile(
          title: Text(item["cardNumber"]),
          subtitle: Text(item["expiryDate"]),
          onTap: () {},
        ));
      }
    });
    return tmp;
  }
}
