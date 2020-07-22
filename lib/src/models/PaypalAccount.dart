import 'dart:convert';

PaypalAccount paypalAccountFromJson(String str) =>
    PaypalAccount.fromJson(json.decode(str));

String paypalAccountToJson(PaypalAccount data) => json.encode(data.toJson());

class PaypalAccount {
  PaypalAccount({
    this.email,
    this.password,
  });

  String email;
  String password;

  factory PaypalAccount.fromJson(Map<String, dynamic> json) {
    return PaypalAccount(
      email: json["email"],
      password: json["password"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
    };
  }
}
