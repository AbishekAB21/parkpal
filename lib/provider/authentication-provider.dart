import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:parkpal/screens/home-screen.dart';
import 'package:parkpal/screens/login-screen.dart';

class AuthenticationProvider with ChangeNotifier {
  final _auth = FirebaseAuth.instance;

  // Sign Up
  Future<void> signUpUser(
      String email, String password, BuildContext context) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print(e);
    }
  }

  // Sign in
  Future<void> signInUser(
      String email, String password, BuildContext context) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
    } catch (e) {
      print(e);
    }
  }

  // Sign out
  Future<void> signOutUser(BuildContext context) async {
    try {
      await _auth.signOut();
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));
    } catch (e) {
      print(e);
    }
  }
}
