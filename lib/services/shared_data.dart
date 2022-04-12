import 'package:shared_preferences/shared_preferences.dart';

class SharedData {
  static SharedPreferences? prefs;

  static getSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future setEmail(var email) async {
    prefs = await SharedPreferences.getInstance();
    return await prefs?.setString("email", email);
  }

  static String getEmail() => prefs?.getString("email") ?? '';
}
