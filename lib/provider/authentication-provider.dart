import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:parkpal/db/database-methods.dart';
import 'package:parkpal/db/shared_pref_helper.dart';
import 'package:parkpal/screens/login-screen.dart';
import 'package:parkpal/utils/app-colors.dart';
import 'package:parkpal/widgets/bottom-nav.dart';
import 'package:parkpal/widgets/reusable-snackbar.dart';
import 'package:random_string/random_string.dart';

class AuthenticationProvider with ChangeNotifier {
  final _auth = FirebaseAuth.instance;

  // Sign Up
  Future<void> signUpUser(
      String email, String password, BuildContext context) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      // Saving user details to firebase
      String id = randomAlphaNumeric(10);
      Map<String, dynamic> addUserInfo = {
        "email": email,
        "id": id,
      };

      DatabaseMethods().addUserDetails(addUserInfo, id);

      // Saving details to local storage
      await SharedPrefHelper().saveUserEmail(email);
      await SharedPrefHelper().saveUserId(id);

      ReusableSnackbar().showSnackbar(context,
          "Account created! - You can now Sign in!", appcolor.successColor);

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));
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
            builder: (context) => BottomNavBar(),
          ));
      ReusableSnackbar().showSnackbar(
          context, "Signed in successfully!", appcolor.successColor);
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
