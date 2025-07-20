import 'package:flutter/material.dart';
import 'package:smart_shop/utils/shared_prefs.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  AuthProvider() {
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    _isLoggedIn = await SharedPrefsHelper.getLoginStatus();
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    // Dummy login validation
    if (email == 'user@example.com' && password == '123456') {
      _isLoggedIn = true;
      await SharedPrefsHelper.setLoginStatus(true);
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<void> logout() async {
    _isLoggedIn = false;
    await SharedPrefsHelper.logout();
    notifyListeners();
  }
}
