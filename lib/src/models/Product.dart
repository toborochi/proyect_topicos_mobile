// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    this.id,
    this.category,
    this.code,
    this.description,
    this.imageUrl,
    this.name,
    this.price,
    this.promo,
    this.stock,
  });

  String id;
  List<String> category;
  String code;
  String description;
  String imageUrl;
  String name;
  double price;
  Promo promo;
  int stock;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        category: List<String>.from(json["category"].map((x) => x)),
        code: json["code"],
        description: json["description"],
        imageUrl: json["image_url"],
        name: json["name"],
        price: json["price"].toDouble(),
        promo: Promo.fromJson(json["promo"]),
        stock: json["stock"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": List<dynamic>.from(category.map((x) => x)),
        "code": code,
        "description": description,
        "image_url": imageUrl,
        "name": name,
        "price": price,
        "promo": promo.toJson(),
        "stock": stock,
      };
}

class Promo {
  Promo({
    this.discount,
    this.endDate,
  });

  double discount;
  int endDate;

  factory Promo.fromJson(Map<String, dynamic> json) => Promo(
        discount: json["discount"].toDouble(),
        endDate: json["endDate"],
      );

  Map<String, dynamic> toJson() => {
        "discount": discount,
        "endDate": endDate,
      };
}
