import 'package:flutter/material.dart';
import 'package:jam/models/user.dart';

class User {
  String username;
  String fullName;
  String email;
  int phone;
  String address;

  User({
    required this.username,
    required this.fullName,
    required this.email,
    required this.phone,
    this.address = "",
  });
}

class UserProvider with ChangeNotifier {
  User _currentUser = User(
    username: '',
    fullName: '',
    email: '',
    phone: 0,
  );

  User get currentUser => _currentUser;

  void updateUser(User user) {
    _currentUser = user;
    notifyListeners();
  }

  void updateAddress(String newAddress) {
    _currentUser.address = newAddress;
    notifyListeners();
  }

  void setUser(UserProfile user) {

  }
}
