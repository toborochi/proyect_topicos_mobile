import 'package:flutter/material.dart';
import 'package:googleapis/dialogflow/v2.dart';
import 'package:proyect_topicos_mobile/src/widgets/views/order_view.dart';
import 'package:proyect_topicos_mobile/src/widgets/views/payment_view.dart';
import 'package:proyect_topicos_mobile/src/widgets/views/products_view.dart';

class ActionProvider with ChangeNotifier {
  Widget _page;

  ActionProvider(this._page);

  getWidget() => _page;

  executeAction(GoogleCloudDialogflowV2QueryResult res) {

    switch(res.action){
      case "get_promo" : _page=ProductsView(); break;
      case "get_current_order" : _page=OrderView(); break;
      case "get_payment_methods" : _page= PaymentView(); break;
    }

    notifyListeners();
  }




}