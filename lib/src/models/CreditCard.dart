import 'dart:convert';

CreditCard creditCardFromJson(String str) =>
    CreditCard.fromJson(json.decode(str));

String creditCardToJson(CreditCard data) => json.encode(data.toJson());

class CreditCard {
  CreditCard({
    this.cardHolderName,
    this.expiryDate,
    this.cardNumber,
    this.cvvCode,
  });

  String cardHolderName;
  String expiryDate;
  String cardNumber;
  String cvvCode;

  factory CreditCard.fromJson(Map<String, dynamic> json) => CreditCard(
        cardHolderName: json["cardHolderName"],
        expiryDate: json["expiryDate"],
        cardNumber: json["cardNumber"],
        cvvCode: json["cvvCode"],
      );

  Map<String, dynamic> toJson() => {
        "cardHolderName": cardHolderName,
        "expiryDate": expiryDate,
        "cardNumber": cardNumber,
        "cvvCode": cvvCode,
      };
}
