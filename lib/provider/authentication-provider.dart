import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:parkpal/screens/home-screen.dart';
import 'package:parkpal/screens/login-screen.dart';
import 'package:parkpal/utils/app-colors.dart';
import 'package:parkpal/widgets/reusable-snackbar.dart';

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
      ReusableSnackbar()
          .showSnackbar(context, "Error creating account", appcolor.errorColor);
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
      ReusableSnackbar()
          .showSnackbar(context, "Signed in successfully!", appcolor.successColor);
    } catch (e) {
      print(e);
      ReusableSnackbar()
          .showSnackbar(context, "Error signing in", appcolor.errorColor);
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
      ReusableSnackbar()
          .showSnackbar(context, "Error signing out", appcolor.errorColor);
    }
  }
}
