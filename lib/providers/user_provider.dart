import 'package:flutter/material.dart';
import 'package:student_app/data/models/user_model.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: '',
    name: '',
    email: '',
    password: '',
    phone: '',
    confirmPassword: '',
    token: '',
    address: '',
    type: '',
    profileImage: '',
    courses: [],
  );
  User get user => _user;

  void setUser(Map<String, dynamic> user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}
