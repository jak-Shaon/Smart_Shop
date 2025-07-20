import 'package:flutter/material.dart';
import 'package:smart_shop/models/product_model.dart';

class CartProvider with ChangeNotifier {
  final Map<int, Product> _items = {};

  Map<int, Product> get items => _items;

  int get itemCount => _items.length;

  double get totalPrice => _items.values.fold(
      0.0, (sum, item) => sum + (item.price));

  void addToCart(Product product) {
    _items[product.id] = product;
    notifyListeners();
  }

  void removeFromCart(int productId) {
    _items.remove(productId);
    notifyListeners();
  }

  bool isInCart(int productId) {
    return _items.containsKey(productId);
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
