import 'package:flutter/material.dart';
import '../models/product.dart';

class FavoritProvider extends ChangeNotifier {
  List<Product> _favoritItems = [];

  List<Product> get favoritItems => _favoritItems;

  bool isFavorite(Product product) {
    return _favoritItems.contains(product);
  }

  void addFavorite(Product product) {
    _favoritItems.add(product);
    notifyListeners();
  }

  void removeFavorite(Product product) {
    _favoritItems.remove(product);
    notifyListeners();
  }
}
