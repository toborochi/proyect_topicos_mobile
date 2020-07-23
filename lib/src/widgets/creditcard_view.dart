import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
// import 'package:proyect_topicos_mobile/src/models/CreditCard.dart';

class CreditCardView extends StatefulWidget {
  final String cardNumber;
  final String expiryDate;
  final String cardHolderName;
  final String cvvCode;

  const CreditCardView(
      {this.cardNumber, this.expiryDate, this.cardHolderName, this.cvvCode});

  @override
  _CreditCardViewState createState() => _CreditCardViewState();
}

class _CreditCardViewState extends State<CreditCardView> {
  CreditCardModel cardModel = CreditCardModel('', '', '', '', false);
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
                    print(cardModel.cardNumber);
                    print(cardModel.cvvCode);
                    print(cardModel.expiryDate);
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
}
