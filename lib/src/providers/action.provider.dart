import 'package:flutter/material.dart';
import 'package:googleapis/dialogflow/v2.dart';
import 'package:proyect_topicos_mobile/src/command/command.dart';
import 'package:proyect_topicos_mobile/src/command/currentordercommand.dart';
import 'package:proyect_topicos_mobile/src/models/Order.dart';
import 'package:proyect_topicos_mobile/src/models/Product.dart';
import 'package:proyect_topicos_mobile/src/widgets/product.select.dart';
import 'package:proyect_topicos_mobile/src/command/deleteproductcommand.dart';
import 'package:proyect_topicos_mobile/src/command/editproductcommand.dart';
import 'package:proyect_topicos_mobile/src/command/getcategorycommand.dart';
import 'package:proyect_topicos_mobile/src/command/getnamecommand.dart';
import 'package:proyect_topicos_mobile/src/command/getpaymentmethodscommand.dart';
import 'package:proyect_topicos_mobile/src/command/getpromocommand.dart';
import 'package:proyect_topicos_mobile/src/command/homepagecommand.dart';
import 'package:proyect_topicos_mobile/src/command/manageordercommand.dart';
import 'package:proyect_topicos_mobile/src/providers/authservice.dart';
import 'package:proyect_topicos_mobile/src/providers/product.provider.dart';

class ActionProvider with ChangeNotifier {
  Widget _page;
  List<Item> _pedido;
  Stream<List<Product>> _s;
  List<Product> _lastProductList;
  Command _com;

  ActionProvider(this._page) {
    _pedido = List<Item>();
    _s = ProductProvider.instance.productStream;
  }

  getWidget() => _page;
  getOrder() {
    return Order(
        item: _pedido,
        date: DateTime.now().millisecondsSinceEpoch,
        clientId: AuthService.instance.uid,
        userId: AuthService.instance.uid,
        amount: _amount());
  }

  double _amount() {
    double tmp = 0;
    _pedido?.forEach((item) => tmp += item.productAmount);
    return tmp;
  }

  getProvider() => _s;


  setPage(Widget w) {
    _page = w;
    notifyListeners();
  }

  clearOrder(){
    _pedido.clear();
  }

  executeAction(GoogleCloudDialogflowV2QueryResult res) async {
    switch (res.action) {
      case "home_page":
        _com = HomePageCommand(setPage);
        await _com.execute();
        break;

      case "delete_product":
        _com = DeleteProductCommand(res, _pedido);
        await _com.execute();
        break;
      case "edit_product":
        _com = EditProductCommand(res, _pedido, setPage);
        await _com.execute();
        break;
      case "get_payment_methods":
        _com = GetPaymentMethodsCommand(setPage, AuthService.instance.uid);
        await _com.execute();
        //_setPage(PaymentView());
        break;

      case "get_category":
        _com = GetCategoryCommand(res, _lastProductList, setPage);
        await _com.execute();
        _lastProductList = await _com.getData();

        break;
      case "get_promo":
        _com = GetPromoCommand(_lastProductList, setPage);
        await _com.execute();
        _lastProductList = await _com.getData();

        break;

      case "get_name":
        _com = GetNameCommand(res, _lastProductList, setPage);
        await _com.execute();
        _lastProductList = await _com.getData();
        break;
      case "manage_order":
        _com = ManageOrderCommand(res, _pedido, setPage);
        await _com.execute();
        break;
      case "get_current_order":
        //_setPage(OrderView(cart: _pedido));
        _com = CurrentOrderCommand(_pedido, setPage);
        await _com.execute();

        break;

      case "get_product":
        String n = res.parameters["producto"];
        int c = int.tryParse(res.parameters["cantidad"].toString());
        Product p;
        if (n.isNotEmpty) {
          for (var i = 0; i < _lastProductList.length; i++) {
            if (_lastProductList[i]
                .name
                .toLowerCase()
                .contains(n.toLowerCase())) {
              p = _lastProductList[i];
              break;
            }
          }

          int i = _pedido.lastIndexWhere((element) =>
              element.name.toLowerCase().contains(n.toLowerCase()));

          if (i >= 0) {
            _pedido[i] = Item(
                name: p.name,
                productAmount: c * p.price,
                productId: p.id,
                productQuantity: c,
                productSalePrice: c *
                    p.price *
                    ((p.promo != null) ? (1 - p.promo.discount) : 1.0));
          } else {
            if (c != null) {
              _pedido.add(Item(
                  name: p.name,
                  productAmount: c * p.price,
                  productId: p.id,
                  productQuantity: c,
                  productSalePrice: c *
                      p.price *
                      ((p.promo != null) ? (1 - p.promo.discount) : 1.0)));
            }
          }

          if (p != null) {
            setPage(ProductSelect(
              product: p,
            ));
          }
        }
        break;
    }
    // Notifica al Scaffold
    notifyListeners();
  }
}
