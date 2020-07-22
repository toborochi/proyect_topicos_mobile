
import 'package:flutter/material.dart';
import 'package:proyect_topicos_mobile/src/widgets/creditcard_view.dart';
import 'package:fluttericon/brandico_icons.dart';
// import 'package:fluttericon/zocial_icons.dart';
import 'package:proyect_topicos_mobile/src/widgets/paypal_view.dart';
import 'package:fluttericon/font_awesome_icons.dart';

class PaymentView extends StatefulWidget {
  @override
  _PaymentViewState createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> with SingleTickerProviderStateMixin {
  final List<Widget> myTabs = <Widget>[
    Tab(
      child: Row(
        children: <Widget>[
          Icon(Brandico.visa),
          Spacer(),
          Icon(Brandico.mastercard),
          Spacer(),
          Icon(Brandico.amex),
          Spacer(),
          Icon(Brandico.discover)
        ],
      )
    ),
    Tab(
      child: Icon(FontAwesome.paypal),
    )
  ];

  final List<Widget> myTabViews = <Widget>[
    CreditCardView(
      cardHolderName: "",
      cardNumber: "",
      cvvCode: "",
      expiryDate: "",
    ),
    PayPalView()
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          TabBar(
              labelColor: Colors.blue,
              controller: _tabController,
              tabs: myTabs),
          Expanded(
              child: TabBarView(
                controller: _tabController,
                children: myTabViews),
              )
        ],
      
    );
  }
}
