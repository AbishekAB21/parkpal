import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
// Add user details
  Future addUserDetails(Map<String, dynamic> userdetailsMap, String id) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .set(userdetailsMap);
  }
}
