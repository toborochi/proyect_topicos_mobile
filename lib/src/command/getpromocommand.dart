import 'package:proyect_topicos_mobile/src/command/command.dart';
import 'package:proyect_topicos_mobile/src/models/Product.dart';
import 'package:proyect_topicos_mobile/src/providers/product.provider.dart';
import 'package:proyect_topicos_mobile/src/widgets/views/products_view.dart';

class GetPromoCommand implements Command{

    List<Product> _lastProductList;
    Function _viewPage;

    GetPromoCommand(this._lastProductList,this._viewPage);

  @override
  Future<void> execute() async {
      this._lastProductList = await ProductProvider.instance.byPromo;
        _viewPage(ProductsView(products: this._lastProductList,));
  }

  @override
  Future getData() async {
    return this._lastProductList;
  }
  
}