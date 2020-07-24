import 'package:proyect_topicos_mobile/src/command/command.dart';
import 'package:proyect_topicos_mobile/src/widgets/views/payment_view.dart';

class GetPaymentMethodsCommand implements Command {

  Function _setView;
  String _uid;

  GetPaymentMethodsCommand(this._setView,this._uid);

  @override
  Future<void> execute() async {
    _setView(PaymentView(uid: this._uid,));
  }

  @override
  Future getData() {
    throw UnimplementedError();
  }

}