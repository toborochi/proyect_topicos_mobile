import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

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
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            child: CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
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
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(40.0))),
          ),
          Container(height: 60),
        ],
      ),
    );
  }
}
