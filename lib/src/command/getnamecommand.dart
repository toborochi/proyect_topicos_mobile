import 'package:googleapis/dialogflow/v2.dart';
import 'package:proyect_topicos_mobile/src/command/command.dart';
import 'package:proyect_topicos_mobile/src/models/Product.dart';
import 'package:proyect_topicos_mobile/src/providers/product.provider.dart';
import 'package:proyect_topicos_mobile/src/widgets/views/products_view.dart';

class GetNameCommand implements Command{

  List<Product> _lastProductList;
  Function _viewPage;
  GoogleCloudDialogflowV2QueryResult _res;

  GetNameCommand(this._res,this._lastProductList,this._viewPage);

  @override
  Future<void> execute() async {
    String name = _res.parameters["producto"].toString();
        if (name.isNotEmpty) {
          this._lastProductList = await ProductProvider.instance.byName(name);
          _viewPage(ProductsView(products: _lastProductList,));
        }
  }

  @override
  Future getData() async {
    return this._lastProductList;
  }

}