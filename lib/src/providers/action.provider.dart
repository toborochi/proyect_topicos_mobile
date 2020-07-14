import 'package:flutter/material.dart';
import 'package:googleapis/dialogflow/v2.dart';
import 'package:proyect_topicos_mobile/src/models/Order.dart';
import 'package:proyect_topicos_mobile/src/models/Product.dart';
import 'package:proyect_topicos_mobile/src/widgets/product/product.select.dart';
import 'package:proyect_topicos_mobile/src/widgets/views/homepage.dart';
import 'package:proyect_topicos_mobile/src/widgets/views/order_view.dart';
import 'package:proyect_topicos_mobile/src/widgets/views/payment_view.dart';
import 'package:proyect_topicos_mobile/src/widgets/views/products_view.dart';

class ActionProvider with ChangeNotifier {

  Widget _page;
  Order _order;

  ActionProvider(this._page){
    _order = Order();
  }

  getWidget() => _page;
  getOrder() => _order;

  _setPage(Widget w){
     if(w.runtimeType!=_page.runtimeType){
       _page = w;
       print("VIEW UPDATED");
     }
  }

  executeAction(GoogleCloudDialogflowV2QueryResult res) {

    switch(res.action){
      case "home_page" : _setPage(HomePage()); break;
      case "get_promo" : _setPage(ProductsView()); break;
      case "get_current_order" : _setPage(OrderView()); break;
      case "get_payment_methods" : _setPage(PaymentView()); break;
      case "get_product" : 

          print(res.parameters);

      ; break;
    }

    notifyListeners();
  }




}