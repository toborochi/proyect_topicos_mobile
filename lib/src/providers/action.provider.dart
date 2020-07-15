import 'package:flutter/material.dart';
import 'package:googleapis/dialogflow/v2.dart';
import 'package:proyect_topicos_mobile/src/models/Category.dart';
import 'package:proyect_topicos_mobile/src/models/Order.dart';
import 'package:proyect_topicos_mobile/src/models/Product.dart';
import 'package:proyect_topicos_mobile/src/providers/category.provider.dart';
import 'package:proyect_topicos_mobile/src/providers/product.provider.dart';
import 'package:proyect_topicos_mobile/src/widgets/product.select.dart';
import 'package:proyect_topicos_mobile/src/widgets/views/homepage.dart';
import 'package:proyect_topicos_mobile/src/widgets/views/order_view.dart';
import 'package:proyect_topicos_mobile/src/widgets/views/payment_view.dart';
import 'package:proyect_topicos_mobile/src/widgets/views/products_view.dart';

class ActionProvider with ChangeNotifier {
  Widget _page;
  Order _order;
  Stream<List<Product>> _s;

  ActionProvider(this._page) {
    _order = Order();
    _s = ProductProvider.instance.productStream;
  }

  getWidget() => _page;
  getOrder() => _order;
  getProvider() => _s;

  _setPage(Widget w) {
    if (w.runtimeType != _page.runtimeType) {
      _page = w;
    }
  }

  executeAction(GoogleCloudDialogflowV2QueryResult res) async {
    switch (res.action) {
      case "home_page":
        _setPage(HomePage());
        break;

      case "get_category":
        String cat = res.parameters["category"].toString();
        if (cat.isNotEmpty) {

          Future<List<Category> > c = CategoryProvider.instance.categories;
          List<Category> f = await c;
          String categoryID = "";
          f.forEach((element) {
            if(element.name==cat){
              categoryID=element.id;
            }
          });
          ProductProvider.instance.byCategory(categoryID);
          _setPage(ProductsView());
        }
      break;
      case "get_promo":
        ProductProvider.instance.byPromo;
        _setPage(ProductsView());
        break;

      case "get_name":
      String name = res.parameters["producto"].toString();
        if(name.isNotEmpty){
           ProductProvider.instance.byName(name);
          _setPage(ProductsView());
        }
        break;
      case "get_current_order":
        _setPage(OrderView());
        break;
      case "get_payment_methods":
        _setPage(PaymentView());
        break;
      case "get_product":

        _setPage(ProductSelect(/* Datos del producto */));
        break;
    }

    notifyListeners();
  }
}
