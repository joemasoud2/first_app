import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:frist_app/app_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class firebaseAuthUtil {
  static Future<bool> loginIn(
      {required String email, required String password}) async {
    bool isLoggedIn = false;
    try {
      var userData = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      isLoggedIn = userData.user != null;
      if (isLoggedIn) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString(AppSettings.EmailSharedPrefsKey, email);
      }
    } catch (e) {
      print(e.toString());
    }
    return isLoggedIn;
  }

  static createAccount(
      {required String email, required String password}) async {
    bool issignUp = false;
    try {
      var userData = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (issignUp) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString(AppSettings.EmailSharedPrefsKey, email);
      }
    } catch (e) {
      print(e.toString());
    }
    return issignUp;
  }
}
