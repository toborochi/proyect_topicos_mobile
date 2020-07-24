import 'package:googleapis/dialogflow/v2.dart';
import 'package:proyect_topicos_mobile/src/command/command.dart';
import 'package:proyect_topicos_mobile/src/models/Order.dart';
import 'package:proyect_topicos_mobile/src/providers/authservice.dart';
import 'package:proyect_topicos_mobile/src/providers/orderProvider.dart';
import 'package:proyect_topicos_mobile/src/widgets/views/order_detail_view.dart';

class ManageOrderCommand implements Command {

  GoogleCloudDialogflowV2QueryResult _res;
  List<Item> _pedido;
  Function _viewPage;

  ManageOrderCommand(this._res, this._pedido,this._viewPage);

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
      Order o = Order(
          item: _pedido,
          date: DateTime.now().millisecondsSinceEpoch,
          clientId: AuthService.instance.uid,
          userId: AuthService.instance.uid,
          amount: _amount());

      Map<String, dynamic> ord = await OrderProvider.instance.saveOrder(o);
      print(ord);

      _viewPage(OrderDetail(
        order: o,
      ));
    }

    if (c.length > 0) {
      _pedido.clear();
    }
  }

  @override
  Future getData() {
    // TODO: implement getData
    throw UnimplementedError();
  }
}