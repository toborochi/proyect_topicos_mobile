import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:proyect_topicos_mobile/screens/LoginScreen.dart';
import 'package:proyect_topicos_mobile/src/scaffold.dart';

class AuthService {
  static AuthService _instance = AuthService();
  static AuthService get instance => _instance;

  //Handles Auth
  handleAuth() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return MyScaffold();
          } else {
            return LoginScreen();
          }
        });
  }

  //Sign out
  signOut() {
    FirebaseAuth.instance.signOut();
  }

  //SignIn
  signIn(AuthCredential authCreds) {
    FirebaseAuth.instance.signInWithCredential(authCreds);
  }

  signInWithOTP(smsCode, verId) {
    signIn(PhoneAuthProvider.getCredential(
        verificationId: verId, smsCode: smsCode));
  }
}
