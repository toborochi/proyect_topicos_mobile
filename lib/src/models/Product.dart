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
  Map<String, String> category;
  String code;
  String description;
  String imageUrl;
  String name;
  double price;
  Promo promo;
  int stock;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      category: Map<String, String>(), //Map.from(json["category"]).map((k, v) => MapEntry<String, String>(k, v)),
      code: json["code"],
      description: json["description"],
      imageUrl: json["image_url"],
      name: json["name"],
      price: double.parse(json["price"]),
      promo: Promo.fromJson(json["promo"]),
      stock: json["stock"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "category":
            Map.from(category).map((k, v) => MapEntry<String, dynamic>(k, v)),
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
