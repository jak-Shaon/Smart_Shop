import 'package:flutter/material.dart';
import 'package:smart_shop/models/product_model.dart';
import 'package:smart_shop/services/api_service.dart';

enum SortOption { priceLowToHigh, priceHighToLow, ratingHighToLow }

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  final List<int> _favourites = [];
  bool _isLoading = false;

  List<Product> get products => _products;
  List<int> get favourites => _favourites;
  bool get isLoading => _isLoading;

  Future<void> loadProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      _products = await ApiService.fetchProducts();
    } catch (e) {
      _products = [];
    }

    _isLoading = false;
    notifyListeners();
  }

  void toggleFavourite(int productId) {
    if (_favourites.contains(productId)) {
      _favourites.remove(productId);
    } else {
      _favourites.add(productId);
    }
    notifyListeners();
  }

  bool isFavourite(int productId) {
    return _favourites.contains(productId);
  }

  SortOption? _currentSort;

  SortOption? get currentSort => _currentSort;

  void sortProducts(SortOption option) {
    _currentSort = option;

    switch (option) {
      case SortOption.priceLowToHigh:
        _products.sort((a, b) => a.price.compareTo(b.price));
        break;
      case SortOption.priceHighToLow:
        _products.sort((a, b) => b.price.compareTo(a.price));
        break;
      case SortOption.ratingHighToLow:
        _products.sort((a, b) => b.rating.compareTo(a.rating));
        break;
      default:
        break;
    }
    notifyListeners();
  }

}
