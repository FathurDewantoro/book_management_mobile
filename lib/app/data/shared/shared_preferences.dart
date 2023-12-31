import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  // Fungsi untuk menyimpan token ke SharedPreferences
  Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<String?> readToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> deleteToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }

  Future<bool> checkLogin() async {
    var token = await readToken();
    if (token != null) {
      return true;
    } else {
      return false;
    }
  }
}
