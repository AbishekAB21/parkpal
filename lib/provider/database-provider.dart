import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:parkpal/db/shared_pref_helper.dart';
import 'package:parkpal/utils/app-colors.dart';
import 'package:parkpal/widgets/reusable-snackbar.dart';

class DatabaseProvider extends ChangeNotifier {
  DatabaseProvider() {
    getUserInfo();
    initializeUserId();
  }
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String? email;
  String? userId;

  // Get user details
  Future<void> getUserInfo() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        email = user.email;
        print("EMAIL: $email");
        notifyListeners();
      } else {
        email = null;
        print("No user is signed in");
      }
    } catch (e) {
      print("Error fetching user info: $e");
    }
  }

  // Initialize user ID from shared preferences
  Future<void> initializeUserId() async {
    userId = await SharedPrefHelper().getUserId();
    notifyListeners();
  }

// Fetch slots
  Stream<List<Map<String, dynamic>>> getSlotsStream() {
    return _firestore.collection('slots').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => doc.data()).toList();
    });
  }

// Book slots
  Future addToActiveBookings(Map<String, dynamic> activeBookings,
      BuildContext context) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('activeBookings')
          .add(activeBookings);
      ReusableSnackbar()
          .showSnackbar(context, "Successfully booked!", appcolor.successColor);
    } catch (e) {
      print(e);
      ReusableSnackbar().showSnackbar(context, "$e", appcolor.errorColor);
    }
  }

  // Get slots
  
}
