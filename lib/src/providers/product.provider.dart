import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:proyect_topicos_mobile/src/models/Product.dart';

class ProductProvider {
  static ProductProvider _instance = ProductProvider();
  static ProductProvider get instance => _instance;

  String url = "https://proyectopicos-efc3c.rj.r.appspot.com/";
  List<Product> products = List();

  final _productStreamController =
      StreamController<List<Product>>.broadcast();
  Function(List<Product>) get productSink =>
      _productStreamController.sink.add;
  Stream<List<Product>> get productStream => _productStreamController.stream;

  Future<List<Product>> get product async {
    List<Product> tmp = List<Product>();
    try {
      final res = await http.get("$url/api/products");
      Map<String, dynamic> data = json.decode(res.body);
      data?.forEach((key, value) {
        value["id"] = key;
        tmp.add(Product.fromJson(value));
      });

      productSink(products = tmp);
      return tmp;
    } catch (e) {
      return tmp;
    }
  }

  dispose() {
    _productStreamController?.close();
  }
}
