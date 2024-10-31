import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {

  static String userIdKey = "USERIDKEY";
  static String userEmailKey = "USEREMAILKEY";


  Future<bool> saveUserId(String getUserId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userIdKey, getUserId);
  }

  Future<bool> saveUserEmail(String getUserEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userEmailKey, getUserEmail);
  }

  Future<String?> getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(userEmailKey);
  }
}