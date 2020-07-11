import 'dart:convert';

Payment paymentFromJson(String str) => Payment.fromJson(json.decode(str));

String paymentToJson(Payment data) => json.encode(data.toJson());

class Payment {
  Payment({
    this.amount,
    this.bill,
    this.date,
    this.description,
    this.orderId,
    this.paymetMethodId,
  });

  int amount;
  Bill bill;
  String date;
  String description;
  String orderId;
  String paymetMethodId;

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      amount        : json["amount"],
      bill          : Bill.fromJson(json["bill"]),
      date          : json["date"],
      description   : json["description"],
      orderId       : json["orderID"],
      paymetMethodId: json["paymet_methodID"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "amount"          : amount,
      "bill"            : bill.toJson(),
      "date"            : date,
      "description"     : description,
      "orderID"         : orderId,
      "paymet_methodID" : paymetMethodId,
    };
  }
}

class Bill {
  Bill({
    this.amount,
    this.dateEmission,
    this.description,
  });

  double amount;
  String dateEmission;
  String description;

  factory Bill.fromJson(Map<String, dynamic> json) {
    return Bill(
      amount      : json["amount"].toDouble(),
      dateEmission: json["date_emission"],
      description : json["description"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "amount"        : amount,
      "date_emission" : dateEmission,
      "description"   : description,
    };
  }
}
