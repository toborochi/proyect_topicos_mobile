// import 'dart:async';

// import 'package:http/http.dart' as http;
// import 'package:proyect_topicos_mobile/src/models/PaypalAccount.dart';

// class PaymentProvider {
//   static PaymentProvider _instance = PaymentProvider();
//   static PaymentProvider get instance => _instance;

//   StreamController<List<dynamic>> _paymentStreamController;
//   String url = "https://shop-8f524.appspot.com/";



//   init() {
//     _paymentStreamController = StreamController<List<dynamic>>.broadcast();
//   }

//   Future<List<PaypalAccount>> get paypalAccounts {
//     List<PaypalAccount> tmp = List<PaypalAccount>();
//     try {
//       final res = await http.get("$url/api/categories");
//       Map<String, dynamic> data = json.decode(res.body);
//       data?.forEach((key, value) {
//         value["id"] = key;
//         tmp.add(Category.fromJson(value));
//       });
//       categorySink(tmp);
//     } catch (e) {
//       print(e);
//     }
//     return tmp;
//   }

//   dispose() => _paymentStreamController?.close();
// }
