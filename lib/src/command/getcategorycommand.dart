import 'package:googleapis/dialogflow/v2.dart';
import 'package:proyect_topicos_mobile/src/command/command.dart';
import 'package:proyect_topicos_mobile/src/models/Category.dart';
import 'package:proyect_topicos_mobile/src/models/Product.dart';
import 'package:proyect_topicos_mobile/src/providers/category.provider.dart';
import 'package:proyect_topicos_mobile/src/providers/product.provider.dart';
import 'package:proyect_topicos_mobile/src/widgets/views/products_view.dart';

class GetCategoryCommand implements Command {
  List<Product> _lastProductList;
  Function _viewPage;
  GoogleCloudDialogflowV2QueryResult _res;

  GetCategoryCommand(this._res,this._lastProductList,this._viewPage);

  @override
  Future<void> execute() async {
    String cat = _res.parameters["category"].toString();
    if (cat.isNotEmpty) {
      Future<List<Category>> c = CategoryProvider.instance.categories;
      List<Category> f = await c;
      String categoryID = "";
      f.forEach((element) {
        if (element.name == cat) {
          categoryID = element.id;
        }
      });

      this._lastProductList = await ProductProvider.instance.byCategory(categoryID);

      _viewPage(ProductsView(
        products: _lastProductList,
      ));
    }
  }

  @override
  Future getData() async {
      return this._lastProductList;
  }
}
