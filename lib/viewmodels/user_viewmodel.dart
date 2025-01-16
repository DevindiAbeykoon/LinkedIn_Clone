import 'package:flutter/material.dart';
import '../models/user_model.dart';

class UserViewModel extends ChangeNotifier {
  UserModel? _currentUser;

  UserModel? get currentUser => _currentUser;

  void login(String email, String password, String username) {
    _currentUser = UserModel(email: email, password: password, username: username);
    notifyListeners();
  }
}
