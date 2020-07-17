import 'package:flutter/material.dart';
import 'package:googleapis/dialogflow/v2.dart';
import 'package:proyect_topicos_mobile/src/models/Category.dart';
import 'package:proyect_topicos_mobile/src/models/Order.dart';
import 'package:proyect_topicos_mobile/src/models/Product.dart';
import 'package:proyect_topicos_mobile/src/providers/category.provider.dart';
import 'package:proyect_topicos_mobile/src/providers/product.provider.dart';
import 'package:proyect_topicos_mobile/src/widgets/product.select.dart';
import 'package:proyect_topicos_mobile/src/widgets/views/homepage.dart';
import 'package:proyect_topicos_mobile/src/widgets/views/order_detail_view.dart';
import 'package:proyect_topicos_mobile/src/widgets/views/order_view.dart';
import 'package:proyect_topicos_mobile/src/widgets/views/payment_view.dart';
import 'package:proyect_topicos_mobile/src/widgets/views/products_view.dart';

class ActionProvider with ChangeNotifier {
  Widget _page;
  List<Item> _pedido;
  Stream<List<Product>> _s;
  List<Product> _lastProductList;

  ActionProvider(this._page) {
    _pedido = List<Item>();
    _s = ProductProvider.instance.productStream;
  }

  getWidget() => _page;
  getOrder() => _pedido;
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

      case "delete_product":
        String name = res.parameters["producto"].toString();
        if (name.isNotEmpty) {
          _pedido.removeWhere(
              (item) => item.name.toLowerCase().contains(name.toLowerCase()));
        }

        break;
      case "edit_product":
        String name = res.parameters["producto"].toString();
        int c = int.tryParse(res.parameters["cantidad"].toString());
        if (name.isNotEmpty) {

              Future<List<Product>> cc = ProductProvider.instance.byName(name);
              List<Product> f = await cc;

              Product p = f.firstWhere((element) => element.name.toLowerCase().contains(name));

          if (p != null) {
            _setPage(ProductSelect(
              product: p,
            ));
          }
          if (c != null && p != null) {
            for (int i = 0; i < _pedido.length; ++i) {
              if (_pedido[i]
                  .name
                  .toLowerCase()
                  .contains(p.name.toLowerCase())) {
                if (c == 0) {
                  _pedido.removeWhere((item) =>
                      item.name.toLowerCase().contains(name.toLowerCase()));
                }else{
                  _pedido[i].productQuantity = c;
                }
              }
            }
          }
        }

        break;
      case "get_payment_methods":
        _setPage(PaymentView());
        break;

      case "get_category":
        String cat = res.parameters["category"].toString();
        if (cat.isNotEmpty) {
          Future<List<Category>> c = CategoryProvider.instance.categories;
          List<Category> f = await c;
          String categoryID = "";
          f.forEach((element) {
            if (element.name == cat) {
              categoryID = element.id;
            }
          });

          _lastProductList =
              await ProductProvider.instance.byCategory(categoryID);
          print("DEBUG");
          _page = ProductsView(
            products: _lastProductList,
          );
        }
        break;
      case "get_promo":
        _lastProductList = await ProductProvider.instance.byPromo;
        _setPage(ProductsView());
        break;

      case "get_name":
        String name = res.parameters["producto"].toString();
        if (name.isNotEmpty) {
          _lastProductList = await ProductProvider.instance.byName(name);
          print("DEBUG");
          _page = ProductsView();
        }
        break;
      case "manage_order":
        String f = res.parameters["finish"];
        String c = res.parameters["cancel"];
        if (f.length > 0) {
          Order o = Order(
              item: _pedido,
              date: DateTime.now().millisecond,
              clientId: "123123",
              userId: "123456",
              amount: 700);
          _setPage(OrderDetail(
            order: o,
          ));
        }

        if (c.length > 0) {
          _pedido.clear();
        }

        break;
      case "get_current_order":
        _setPage(OrderView(cart: _pedido));
        break;
      case "get_payment_methods":
        _setPage(PaymentView());
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

          if (p != null) {
            _setPage(ProductSelect(
              product: p,
            ));
          }
        }
        break;
    }
    notifyListeners();
  }
}
