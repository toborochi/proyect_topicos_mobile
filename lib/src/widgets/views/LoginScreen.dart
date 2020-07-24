import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:international_phone_input/international_phone_input.dart';
import 'package:proyect_topicos_mobile/src/providers/authservice.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  bool codeSent = false;
  String phoneNumber, phoneIsoCode, verificationId, smsCode;

  @override
  Widget build(BuildContext context) {
 

    final size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        body: Container(
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0, size.height * .1, 0, 5),
                child: Text(
                  "Verificar Nro de Teléfono",
                  style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent),
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.fromLTRB(20, 20, 20, 8),
                child: Text(
                    "La aplicación te enviará un SMS para que puedas acceder a todos los servicios :)",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    )),
              ),
              Expanded(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: size.height * .08),
                      child: Image.asset(
                        "assets/phone.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Opacity(
                      opacity: .8,
                      child: Expanded(
                        child: Container(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.only(top: size.height * .18),
                            child: InternationalPhoneInput(
                              onPhoneNumberChange: onPhoneNumberChange,
                              initialPhoneNumber: phoneNumber,
                              initialSelection: "+591",
                            )),
                        SizedBox(
                          height: size.height * .05,
                        ),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(21)),
                          color: Colors.blue,
                          textColor: Colors.white,
                          child: Text(
                            "Continuar",
                            style: TextStyle(fontSize: 28),
                          ),
                          onPressed: () {
                            if (codeSent) {
                              AuthService.instance
                                  .signInWithOTP(smsCode, verificationId);
                            } else {
                              verifyPhone("$phoneIsoCode");
                            }
                          },
                        ),
                        codeSent
                            ? Padding(
                                padding:
                                    EdgeInsets.only(left: 25.0, right: 25.0),
                                child: TextFormField(
                                  keyboardType: TextInputType.phone,
                                  decoration:
                                      InputDecoration(hintText: 'Enter OTP'),
                                  onChanged: (val) {
                                    setState(() {
                                      this.smsCode = val;
                                    });
                                  },
                                ))
                            : Container(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  void onPhoneNumberChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
      this.phoneNumber = number;
      this.phoneIsoCode = internationalizedPhoneNumber;
    });
  }

  Future<void> verifyPhone(String phoneNo) async {
    final PhoneVerificationCompleted verified =
        (AuthCredential authResult) => AuthService.instance.signIn(authResult);

    final PhoneVerificationFailed verificationfailed =
        (AuthException authException) => print('${authException.message}');

    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
      this.verificationId = verId;
      setState(() => this.codeSent = true);
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      this.verificationId = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNo,
        timeout: const Duration(seconds: 60),
        verificationCompleted: verified,
        verificationFailed: verificationfailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeout);
  }
}
