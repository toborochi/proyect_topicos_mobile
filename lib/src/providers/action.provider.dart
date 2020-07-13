import 'package:flutter/material.dart';
import 'package:proyect_topicos_mobile/src/widgets/views/products_view.dart';

class ActionProvider with ChangeNotifier {
  Widget _page;

  ActionProvider(this._page);

  getWidget() => _page;

  executeAction(String action) {

    switch(action){
      case "get_promo" : _page=ProductsView(); break;
      default : _page = Text("Chupalaaa"); break;
    }

    notifyListeners();
  }




}