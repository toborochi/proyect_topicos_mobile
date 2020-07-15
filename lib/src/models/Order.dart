import 'dart:convert';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

class Order {
  Order({
    this.amount,
    this.clientId,
    this.date,
    this.shoppingCart,
    this.userId,
  });

  double amount;
  String clientId;
  int date;
  List<ShoppingCart> shoppingCart;
  String userId;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        amount: json["amount"].toDouble(),
        clientId: json["clientID"],
        date: json["date"],
        shoppingCart: List<ShoppingCart>.from(
            json["shopping_cart"].map((x) => ShoppingCart.fromJson(x))),
        userId: json["userID"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "clientID": clientId,
        "date": date,
        "shopping_cart":
            List<dynamic>.from(shoppingCart.map((x) => x.toJson())),
        "userID": userId,
      };
}

class ShoppingCart {
  ShoppingCart({
    this.productId,
    this.productAmount,
    this.productQuantity,
    this.productSalePrice,
  });

  String productId;
  double productAmount;
  int productQuantity;
  double productSalePrice;

  factory ShoppingCart.fromJson(Map<String, dynamic> json) => ShoppingCart(
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
