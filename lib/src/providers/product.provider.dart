import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:proyect_topicos_mobile/src/models/Product.dart';

class ProductProvider {
  static ProductProvider _instance = ProductProvider();
  static ProductProvider get instance => _instance;

  StreamController<List<Product>> _productStreamController;
  final String url = "https://shop-8f524.appspot.com/";

  Function(List<Product>) get productSink => _productStreamController.sink.add;
  Stream<List<Product>> get productStream => _productStreamController.stream;

  init() {
    _productStreamController = StreamController<List<Product>>.broadcast();
  }

  Future<List<Product>> get product async {
    List<Product> tmp = List<Product>();
    try {
      final res = await http.get("$url/api/products");
      Map<String, dynamic> data = json.decode(res.body);
      data?.forEach((key, value) {
        value["id"] = key;
        tmp.add(Product.fromJson(value));
      });
      productSink(tmp);
    } catch (e) {
      print(e);
    }
    return tmp;
  }

  Future<List<Product>> get byPromo async {
    List<Product> tmp = List<Product>();
    try {
      final res = await http.get("$url/api/products/promo/get");
      List data = json.decode(res.body);
      data?.forEach((item) {
        tmp.add(Product.fromJson(item));
      });
      productSink(tmp);
    } catch (e) {
      print(e);
    }
    return tmp;
  }

  Future<List<Product>> byCategory(String categoryID) async {
    List<Product> tmp = List<Product>();
    try {
      final res = await http.get("$url/api/products/category/$categoryID");
      List data = json.decode(res.body);
      data?.forEach((item) => tmp.add(Product.fromJson(item)));
      productSink(tmp);
    } catch (e) {
      print(e);
    }
    return tmp;
  }

  Future<List<Product>> byName(String product) async {
    List<Product> tmp = List<Product>();
    try {
      final res = await http.get("$url/api/products/name/$product");
      List data = json.decode(res.body);
      data?.forEach((item) => tmp.add(Product.fromJson(item)));
      productSink(tmp);
    } catch (e) {
      print(e);
    }
    return tmp;
  }

  dispose() {
    _productStreamController?.close();
  }
}
