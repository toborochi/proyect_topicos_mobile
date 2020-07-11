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

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      amount      : json["amount"].toDouble(),
      clientId    : json["clientID"],
      date        : json["date"],
      shoppingCart: List<ShoppingCart>.from(
        json["shopping_cart"].map((x) => ShoppingCart.fromJson(x))
      ),
      userId      : json["userID"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "amount"        : amount,
      "clientID"      : clientId,
      "date"          : date,
      "shopping_cart" : List<dynamic>.from(shoppingCart.map((x) => x.toJson())),
      "userID"        : userId,
    };
  }
}

class ShoppingCart {
  ShoppingCart({
    this.productId,
    this.productAmount,
    this.productQuantity,
    this.productSalePrice,
  });

  String productId;
  int productAmount;
  int productQuantity;
  int productSalePrice;

  factory ShoppingCart.fromJson(Map<String, dynamic> json) {
    return ShoppingCart(
      productId       : json["productID"],
      productAmount   : json["product_amount"],
      productQuantity : json["product_quantity"],
      productSalePrice: json["product_sale_price"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "productID"         : productId,
      "product_amount"    : productAmount,
      "product_quantity"  : productQuantity,
      "product_sale_price": productSalePrice,
    };
  }
}
