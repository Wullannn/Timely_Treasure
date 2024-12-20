import 'package:flutter/material.dart';
import '../models/cart_item.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addItem(CartItem item) {
    _cartItems.add(item);
    notifyListeners();
  }

  void toggleItemSelection(CartItem item) {
    final index = _cartItems.indexOf(item);
    if (index != -1) {
      _cartItems[index].isSelected = !_cartItems[index].isSelected;
      notifyListeners();
    }
  }

  int get selectedItemCount =>
      _cartItems.where((item) => item.isSelected).length;

  String get totalPrice {
    double total = 0;
    for (var item in _cartItems) {
      if (item.isSelected) {
        total += double.parse(
          item.price.replaceAll('.', '').replaceAll(',', '.'),
        );
      }
    }
    return total.toStringAsFixed(0).replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
          (match) => '${match[1]}.',
    );
  }
}
