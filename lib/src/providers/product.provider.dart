import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:proyect_topicos_mobile/src/models/Product.dart';

class ProductProvider {
  static ProductProvider _instance = ProductProvider();
  static ProductProvider get instance => _instance;

  final String url = "https://proyectopicos-efc3c.rj.r.appspot.com/";
  final _productStreamController = StreamController<List<Product>>.broadcast();

  Function(List<Product>) get productSink => _productStreamController.sink.add;
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
        Map m = item["category"];
        List<String> cats = List();
        m.forEach((k, v) => cats.add(v));
        item["category"] = cats;
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
      data?.forEach((item) {
        Map<String, dynamic> p = Map.from(item);
        tmp.add(Product.fromJson(p));
      });
      productSink(tmp);
    } catch (e) {
      print(e);
    }
    return tmp;
  }

  Future<List<Product>> byName(String name) {
    
  }
  dispose() {
    _productStreamController?.close();
  }
}
