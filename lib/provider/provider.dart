import 'package:flutter/material.dart';
import '../models/user.dart';

class User {
  String username;
  String fullName;
  String email;
  String phone;
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
    phone: '',
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

  void updateProfile({required String username, required String fullName, required String phone, required String email, required String address}) {}
}