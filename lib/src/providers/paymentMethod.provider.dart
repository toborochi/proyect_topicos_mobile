import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:proyect_topicos_mobile/src/models/PaypalAccount.dart';

class PaymentProvider {
  static PaymentProvider _instance = PaymentProvider();
  static PaymentProvider get instance => _instance;

  StreamController<List<dynamic>> _paymentStreamController;
  String _url = "https://shop-8f524.appspot.com";

  init() {
    _paymentStreamController = StreamController<List<dynamic>>.broadcast();
  }

  createCreditCard(String userID, CreditCardModel creditCardModel) async {
    try {
      await http.post("$_url/api/paymentMethods", body: {
        "userID": userID,
        "clientID": userID,
        "cardHolderName": creditCardModel.cardHolderName,
        "expiryDate": creditCardModel.expiryDate,
        "cardNumber": creditCardModel.cardNumber,
        "cvvCode": creditCardModel.cvvCode,
      });
    } catch (e) {
      print(e);
    }
  }

  createPaypalAccount(String userID, PaypalAccount paypalAccount) async {
    try {
      await http.post("$_url/api/paymentMethods", body: {
        "userID": userID,
        "clientID": userID,
        "email": paypalAccount.email,
        "password": paypalAccount.password
      });
    } catch (e) {
      print(e);
    }
  }

  Future<List> getPaymentMethods(String userID) async {
    List tmp = List();
    try {
      var res = await http.get("$_url/api/paymentMethods/$userID/$userID");
      List data = json.decode(res.body);
      data?.forEach((item) => tmp.add(item));
    } catch (e) {
      print(e);
    }
    return tmp;
  }

  dispose() => _paymentStreamController?.close();
}
