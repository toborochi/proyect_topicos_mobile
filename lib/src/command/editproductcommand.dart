import 'package:googleapis/dialogflow/v2.dart';
import 'package:proyect_topicos_mobile/src/command/command.dart';
import 'package:proyect_topicos_mobile/src/models/Order.dart';
import 'package:proyect_topicos_mobile/src/models/Product.dart';
import 'package:proyect_topicos_mobile/src/providers/product.provider.dart';
import 'package:proyect_topicos_mobile/src/widgets/product.select.dart';

class EditProductCommand implements Command {
  GoogleCloudDialogflowV2QueryResult _res;
  List<Item> _pedido;
  Function _changeView;

  EditProductCommand(this._res, this._pedido, this._changeView);

  @override
  Future<void> execute() async {
    String name = _res.parameters["producto"].toString();
    int c = int.tryParse(_res.parameters["cantidad"].toString());
    if (name.isNotEmpty) {
      Future<List<Product>> cc = ProductProvider.instance.byName(name);
      List<Product> f = await cc;

      Product p =
          f.firstWhere((element) => element.name.toLowerCase().contains(name));

      if (p != null) {
        _changeView(ProductSelect(
          product: p,
        ));
      }
      if (c != null && p != null) {
        for (int i = 0; i < _pedido.length; ++i) {
          if (_pedido[i].name.toLowerCase().contains(p.name.toLowerCase())) {
            if (c == 0) {
              _pedido.removeWhere((item) =>
                  item.name.toLowerCase().contains(name.toLowerCase()));
            } else {
              _pedido[i].productQuantity = c;
            }
          }
        }
      }
    }
  }

  @override
  Future getData() => throw UnimplementedError();
}
