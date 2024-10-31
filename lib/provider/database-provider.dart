import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DatabaseProvider extends ChangeNotifier {

  DatabaseProvider(){
    getUserInfo();
  }
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String? email;

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

// Fetch slots
  Stream<List<Map<String, dynamic>>> getSlotsStream() {
    return _firestore.collection('slots').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => doc.data()).toList();
    });
  }

// Book slots
  
}
