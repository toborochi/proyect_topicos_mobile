import 'package:googleapis/dialogflow/v2.dart';
import 'package:proyect_topicos_mobile/src/command/command.dart';
import 'package:proyect_topicos_mobile/src/models/Order.dart';
import 'package:proyect_topicos_mobile/src/providers/authservice.dart';
import 'package:proyect_topicos_mobile/src/providers/orderProvider.dart';
import 'package:proyect_topicos_mobile/src/providers/paymentMethod.provider.dart';
import 'package:proyect_topicos_mobile/src/widgets/views/paymentList.dart';

class ManageOrderCommand implements Command {
  GoogleCloudDialogflowV2QueryResult _res;
  List<Item> _pedido;
  Function _viewPage;

  ManageOrderCommand(this._res, this._pedido, this._viewPage);

  double _amount() {
    double tmp = 0;
    _pedido?.forEach((item) => tmp += item.productAmount);
    return tmp;
  }

  @override
  Future<void> execute() async {
    String f = _res.parameters["finish"];
    String c = _res.parameters["cancel"];

    if (f.length > 0) {
      
      /*
      Order o = Order(
          item: _pedido,
          date: DateTime.now().millisecondsSinceEpoch,
          clientId: AuthService.instance.uid,
          userId: AuthService.instance.uid,
          amount: _amount());

      if (_pedido.length > 0) {
        Map<String, dynamic> ord = await OrderProvider.instance.saveOrder(o);
        print(ord);
      }*/

      List<dynamic> p = await PaymentProvider.instance
          .getPaymentMethods(AuthService.instance.uid);

      _viewPage(PaymentList(uid: AuthService.instance.uid, paymentsMethods: p));

      /*
      _viewPage(OrderDetail(
        order: o,
      ));*/
    }

    if (c.length > 0) {
      _pedido.clear();
    }
  }

  @override
  Future getData() => throw UnimplementedError();
}
