import 'package:proyect_topicos_mobile/src/command/command.dart';
import 'package:proyect_topicos_mobile/src/widgets/views/payment_view.dart';

class GetPaymentMethodsCommand implements Command {

  Function _setView;

  GetPaymentMethodsCommand(this._setView);

  @override
  Future<void> execute() async {
    _setView(PaymentView());
  }

  @override
  Future getData() {
    // TODO: implement getData
    throw UnimplementedError();
  }

}