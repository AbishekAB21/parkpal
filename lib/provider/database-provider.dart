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
  Future addToActiveBookings(
      Map<String, dynamic> activeBookings, BuildContext context) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('activeBookings')
          .add(activeBookings);
      ReusableSnackbar()
          .showSnackbar(context, "Successfully booked!", appcolor.successColor);
      String slotName = activeBookings["slotName"];
      QuerySnapshot slotQuery = await _firestore
          .collection('slots')
          .where('slotName', isEqualTo: slotName)
          .limit(1)
          .get();

      if (slotQuery.docs.isNotEmpty) {
       
        String slotDocId = slotQuery.docs.first.id;

        // Updating the isbooked field to true
        await _firestore.collection('slots').doc(slotDocId).update({
          'isbooked': true,
        });
      } else {
        print("No slot found with the name $slotName");
      }
    } catch (e) {
      print(e);
      ReusableSnackbar().showSnackbar(context, "$e", appcolor.errorColor);
    }
  }

  // Get active bookings
  Stream<List<Map<String, dynamic>>> getActiveBookingsStream() {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('activeBookings')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  // Release slot
  Future<void> releaseSlot(BuildContext context, String bookingId) async {
    try {
      if (bookingId.isEmpty) {
        throw Exception("Booking ID cannot be empty");
      }

      print("Searching for booking with ID: $bookingId");

      final querySnapshot = await _firestore
          .collection('users')
          .doc(userId)
          .collection('activeBookings')
          .where('bookingId', isEqualTo: bookingId)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs) {
          final bookingData = doc.data();
          final slotName = bookingData['slotName'];

          await _firestore
              .collection('users')
              .doc(userId)
              .collection('previousBookings')
              .doc(bookingId)
              .set(bookingData);

          print(
              "Successfully saved booking data to previousBookings for ID: $bookingId");

          await doc.reference.delete();
          print("Successfully deleted booking with ID: $bookingId");

          if (slotName != null) {
            final slotQuery = await _firestore
                .collection('slots')
                .where('slotName', isEqualTo: slotName)
                .limit(1)
                .get();

            if (slotQuery.docs.isNotEmpty) {
              String slotDocId = slotQuery.docs.first.id;

              await _firestore.collection('slots').doc(slotDocId).update({
                'isbooked': false,
              });
              print("Successfully updated slot $slotName to not booked");
            } else {
              print("No slot found with the name $slotName");
            }
          } else {
            print("No slot name found in the booking data");
          }
        }
      } else {
        print("No booking found with ID: $bookingId");
        ReusableSnackbar().showSnackbar(context,
            "No booking found with ID: $bookingId", appcolor.errorColor);
      }
    } catch (e) {
      print("Error releasing booking: $e");
      ReusableSnackbar().showSnackbar(context, "$e", appcolor.errorColor);
    }
  }

  // Get previous bookings
  Stream<List<Map<String, dynamic>>> getPreviousBookingsStream() {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('previousBookings')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => doc.data()).toList();
    });
  }
}
