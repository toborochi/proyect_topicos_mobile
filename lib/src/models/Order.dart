import 'dart:convert';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

class Order {
  Order({
    this.amount,
    this.clientId,
    this.date,
    this.item,
    this.userId,
  });

  double amount;
  String clientId;
  int date;
  List<Item> item;
  String userId;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        amount: json["amount"].toDouble(),
        clientId: json["clientID"],
        date: json["date"],
        item: List<Item>.from(json["item"].map((x) => Item.fromJson(x))),
        userId: json["userID"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "clientID": clientId,
        "date": date,
        "item": List<dynamic>.from(item.map((x) => x.toJson())),
        "userID": userId,
      };
}

class Item {
  Item({
    this.name,
    this.productId,
    this.productAmount,
    this.productQuantity,
    this.productSalePrice,
  });

  String name;
  String productId;
  double productAmount;
  int productQuantity;
  double productSalePrice;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        productId: json["productID"],
        productAmount: json["product_amount"].toDouble(),
        productQuantity: json["product_quantity"],
        productSalePrice: json["product_sale_price"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "productID": productId,
        "product_amount": productAmount,
        "product_quantity": productQuantity,
        "product_sale_price": productSalePrice,
      };
}
