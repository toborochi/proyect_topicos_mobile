import 'dart:convert';


Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    this.category,
    this.code,
    this.description,
    this.imageUrl,
    this.name,
    this.price,
    this.promo,
    this.stock,
  });

  List<String> category;
  String code;
  String description;
  String imageUrl;
  String name;
  double price;
  Promo promo;
  int stock;

  factory Product.fromJson(Map<String, dynamic> data) {

    return Product(
      category    : List<String>(),
      code        : data["code"],
      description : data["description"],
      imageUrl    : data["image_url"],
      name        : data["name"],
      price       : double.parse(data["price"]),
      promo       : Promo.fromJson(data["promo"]),
      stock       : data["stock"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "category"    : List<dynamic>.from(category.map((x) => x)),
      "code"        : code,
      "description" : description,
      "image_url"   : imageUrl,
      "name"        : name,
      "price"       : price,
      "promo"       : promo.toJson(),
      "stock"       : stock,
    };
  }
}

class Promo {
  Promo({
    this.discount,
    this.endDate,
  });

  double discount;
  int endDate;

  factory Promo.fromJson(Map<String, dynamic> json) {
    return Promo(
      discount: json["discount"].toDouble(),
      endDate : json["endDate"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "discount": discount,
      "endDate" : endDate,
    };
  }
}
