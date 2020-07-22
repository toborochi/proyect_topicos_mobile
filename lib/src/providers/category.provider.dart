import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:proyect_topicos_mobile/src/models/Category.dart';

class CategoryProvider {
  static CategoryProvider _instance = CategoryProvider();
  static CategoryProvider get instance => _instance;

  StreamController<List<Category>> _categoryStreamController;
  String url = "https://shop-8f524.appspot.com/";

  Function(List<Category>) get categorySink =>
      _categoryStreamController.sink.add;
  Stream<List<Category>> get categoryStream => _categoryStreamController.stream;

  init() {
    _categoryStreamController = StreamController<List<Category>>.broadcast();
  }

  Future<List<Category>> get categories async {
    List<Category> tmp = List<Category>();
    try {
      final res = await http.get("$url/api/categories");
      Map<String, dynamic> data = json.decode(res.body);
      data?.forEach((key, value) {
        value["id"] = key;
        tmp.add(Category.fromJson(value));
      });
      categorySink(tmp);
      return tmp;
    } catch (e) {
      return tmp;
    }
  }

  dispose() {
    _categoryStreamController?.close();
  }
}
