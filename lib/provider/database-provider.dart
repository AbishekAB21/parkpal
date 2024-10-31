import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DatabaseProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


// Fetch slots
  Stream<List<Map<String, dynamic>>> getSlotsStream() {
    return _firestore.collection('slots').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => doc.data()).toList();
    });
  }

// Book slots
  
}
