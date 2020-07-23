import 'package:proyect_topicos_mobile/src/command/command.dart';
import 'package:proyect_topicos_mobile/src/models/Order.dart';
import 'package:proyect_topicos_mobile/src/widgets/views/order_view.dart';

class CurrentOrderCommand implements Command{

  Function _changeView;
  List<Item> _pedido;

  CurrentOrderCommand(this._pedido,this._changeView);

  @override
  Future<void> execute() async {
     _changeView(OrderView(cart: _pedido));
  }

  @override
  Future getData() {
    throw UnimplementedError();
  }

}