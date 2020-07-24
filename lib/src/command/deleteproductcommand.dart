import 'package:googleapis/dialogflow/v2.dart';
import 'package:proyect_topicos_mobile/src/command/command.dart';
import 'package:proyect_topicos_mobile/src/models/Order.dart';

class DeleteProductCommand implements Command {

  GoogleCloudDialogflowV2QueryResult _res;
  List<Item> _pedido;

  DeleteProductCommand(this._res, this._pedido);

  @override
  Future<void> execute() async {
    String name = _res.parameters["producto"].toString();
    if (name.isNotEmpty) {
      _pedido.removeWhere(
          (item) => item.name.toLowerCase().contains(name.toLowerCase()));
    }
  }

  @override
  Future getData() => throw UnimplementedError();
}
