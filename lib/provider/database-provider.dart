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
  final userUID = FirebaseAuth.instance.currentUser!.uid;

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

  // Get active bookings
  Stream<List<Map<String, dynamic>>> getActiveBookingsStream() {
    return _firestore
        .collection('users')
        .doc(userUID)
        .collection('activeBookings')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  // Get previous bookings
  Stream<List<Map<String, dynamic>>> getPreviousBookingsStream() {
    return _firestore
        .collection('users')
        .doc(userUID)
        .collection('previousBookings')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  //-------------- NEW METHODS --------------

  // Book slots
  Future<void> bookSlots(
      Map<String, dynamic> activeBookingData, BuildContext context) async {
    try {
     
      final bookingTime = Timestamp.now();
      activeBookingData['bookingTime'] = bookingTime;

      
      await _firestore
          .collection('users')
          .doc(userUID)
          .collection('activeBookings')
          .add(activeBookingData);

      
      String slotName = activeBookingData["slotName"];
      QuerySnapshot slotQuery = await _firestore
          .collection('slots')
          .where('slotName', isEqualTo: slotName)
          .limit(1)
          .get();

      if (slotQuery.docs.isNotEmpty) {
        String slotDocId = slotQuery.docs.first.id;
        await _firestore.collection('slots').doc(slotDocId).update({
          'isbooked': true,
        });
      }

      
      ReusableSnackbar()
          .showSnackbar(context, "Successfully booked!", appcolor.successColor);
    } catch (e) {
      print(e);
      ReusableSnackbar().showSnackbar(context, "$e", appcolor.errorColor);
    }
  }

  // Release slot and calculate cost
  Future<void> freeUpSlots(BuildContext context, String bookingId) async {
    try {
      
      final querySnapshot = await _firestore
          .collection('users')
          .doc(userUID)
          .collection('activeBookings')
          .where('bookingId', isEqualTo: bookingId)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        var doc = querySnapshot.docs.first;
        final bookingData = doc.data();

        
        final bookingTime = (bookingData['bookingTime'] as Timestamp).toDate();
        final releaseTime = DateTime.now();
        final durationInMinutes = releaseTime.difference(bookingTime).inMinutes;

        double cost = 0.0;
        if (durationInMinutes > 10) {
          final exactHours = durationInMinutes / 60;
          cost = exactHours * 100; 
        }

        
        bookingData['releaseTime'] = Timestamp.fromDate(releaseTime);
        bookingData['duration'] = durationInMinutes;
        bookingData['cost'] = cost;

        
        await _firestore
            .collection('users')
            .doc(userUID)
            .collection('previousBookings')
            .doc(bookingId)
            .set(bookingData);

        
        await doc.reference.delete();

       
        String slotName = bookingData['slotName'];
        QuerySnapshot slotQuery = await _firestore
            .collection('slots')
            .where('slotName', isEqualTo: slotName)
            .limit(1)
            .get();

        if (slotQuery.docs.isNotEmpty) {
          String slotDocId = slotQuery.docs.first.id;
          await _firestore.collection('slots').doc(slotDocId).update({
            'isbooked': false,
          });
        }

        
        ReusableSnackbar().showSnackbar(
            context,
            "Slot released. Total cost: \$${cost.toStringAsFixed(2)}",
            appcolor.successColor);
      } else {
        ReusableSnackbar().showSnackbar(context,
            "No booking found with ID: $bookingId", appcolor.errorColor);
      }
    } catch (e) {
      print("Error releasing slot: $e");
      ReusableSnackbar().showSnackbar(context, "$e", appcolor.errorColor);
    }
  }


  
  double calculateCost(DateTime bookingTime, DateTime releaseTime) {
    final durationInMinutes = releaseTime.difference(bookingTime).inMinutes;
    double cost = 0.0;
    if (durationInMinutes > 10) {
      final exactHours = durationInMinutes / 60;
      cost = exactHours * 100; 
    }
    return cost;
  }
}
