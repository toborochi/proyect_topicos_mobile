import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:provider/provider.dart';
import 'package:proyect_topicos_mobile/src/providers/action.provider.dart';
import 'package:proyect_topicos_mobile/src/providers/paymentMethod.provider.dart';
import 'package:proyect_topicos_mobile/src/widgets/views/homepage.dart';
// import 'package:proyect_topicos_mobile/src/models/CreditCard.dart';

class CreditCardView extends StatefulWidget {
  final String uid;
  const CreditCardView({this.uid});

  @override
  _CreditCardViewState createState() => _CreditCardViewState();
}

class _CreditCardViewState extends State<CreditCardView> {
  CreditCardModel cardModel = CreditCardModel(
      '4242 4242 4242 4242', '10/24', '5766', 'Pedro Caricari', false);
  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() => cardModel = creditCardModel);
  }

  bool _cardValidated() {
    return cardModel.cardHolderName.isNotEmpty &&
        cardModel.expiryDate.isNotEmpty &&
        cardModel.cvvCode.isNotEmpty &&
        cardModel.cardNumber.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            child: CreditCardWidget(
              cvvCode: cardModel.cvvCode,
              cardNumber: cardModel.cardNumber,
              expiryDate: cardModel.expiryDate,
              showBackView: cardModel.isCvvFocused,
              cardHolderName: cardModel.cardHolderName,
            ),
          ),
          CreditCardForm(
            onCreditCardModelChange: onCreditCardModelChange,
          ),
          ButtonTheme(
            minWidth: 300,
            height: 60,
            child: RaisedButton(
                color: Colors.lightGreen,
                child: Text("Continuar",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                onPressed: () {
                  if (_cardValidated()) {
                    PaymentProvider.instance.createCreditCard(this.widget.uid, this.cardModel);
                    changeView(context);
                  }
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0))),
          ),
          Container(height: 60),
        ],
      ),
    );
  }

  void changeView(BuildContext context) {
    Provider.of<ActionProvider>(context, listen: false).setPage(HomePage());
  }
}
