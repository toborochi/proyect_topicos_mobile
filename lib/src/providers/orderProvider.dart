import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:proyect_topicos_mobile/src/models/Order.dart';

class OrderProvider {
  static OrderProvider _instance = OrderProvider();
  static OrderProvider get instance => _instance;

  StreamController<List<Order>> _orderStreamController;
  final String url = "https://shop-8f524.appspot.com";

  Function(List<Order>) get productSink => _orderStreamController.sink.add;
  Stream<List<Order>> get productStream => _orderStreamController.stream;

  init() {
    _orderStreamController = StreamController<List<Order>>.broadcast();
  }

  Future<Map<String, dynamic>> saveOrder(Order order) async {
    Map<String, dynamic> tmp = Map<String, dynamic>();
    try {
      final res = await http.post(
        "$url/api/ordersTest/",
        body: jsonEncode(order.toJson()),
        headers: {"Content-Type": "application/json"}
      );
      
      tmp = json.decode(res.body);
    } catch (e) {
      print(e);
    }
    return tmp;
  }

  Future<List<Order>> get order async {
    List<Order> tmp = List<Order>();
    try {
      final res = await http.get("$url/api/orders");
      Map<String, dynamic> data = json.decode(res.body);
      data?.forEach((key, value) {
        value["id"] = key;
        tmp.add(Order.fromJson(value));
      });
      productSink(tmp);
    } catch (e) {
      print(e);
    }
    return tmp;
  }

  dispose() {
    _orderStreamController?.close();
  }
}
