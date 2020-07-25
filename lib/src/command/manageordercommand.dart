import 'package:googleapis/dialogflow/v2.dart';
import 'package:proyect_topicos_mobile/src/models/Order.dart';
import 'package:proyect_topicos_mobile/src/command/command.dart';
import 'package:proyect_topicos_mobile/src/providers/authservice.dart';
import 'package:proyect_topicos_mobile/src/widgets/views/paymentList.dart';
import 'package:proyect_topicos_mobile/src/providers/paymentMethod.provider.dart';

class ManageOrderCommand implements Command {
  GoogleCloudDialogflowV2QueryResult _res;
  List<Item> _pedido;
  Function _viewPage;

  ManageOrderCommand(this._res, this._pedido, this._viewPage);

  @override
  Future<void> execute() async {
    String f = _res.parameters["finish"];
    String c = _res.parameters["cancel"];

    if (f.length > 0) {
      List p = await PaymentProvider.instance
          .getPaymentMethods(AuthService.instance.uid);
      print(p);
      _viewPage(PaymentList(uid: AuthService.instance.uid, paymentsMethods: p));
    }

    if (c.length > 0) {
      _pedido.clear();
    }
  }

  @override
  Future getData() => throw UnimplementedError();
}
