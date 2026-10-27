import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String name;
  final String image;
  final double price;
  int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    this.quantity = 1,
  });
}

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  // Add to Cart
  void addToCart(CartItem item) {
    int index = _items.indexWhere((element) => element.id == item.id);

    if (index >= 0) {
      _items[index].quantity++;
    } else {
      _items.add(item);
    }

    notifyListeners();
  }

  // Quantity Increase
  void increaseQuantity(String id) {
    int index = _items.indexWhere((item) => item.id == id);

    if (index >= 0) {
      _items[index].quantity++;
      notifyListeners();
    }
  }

  // Quantity Decrease
  void decreaseQuantity(String id) {
    int index = _items.indexWhere((item) => item.id == id);

    if (index >= 0) {
      if (_items[index].quantity > 1) {
        _items[index].quantity--;
      } else {
        _items.removeAt(index);
      }

      notifyListeners();
    }
  }

  // Remove Item
  void removeItem(String id) {
    _items.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  // Total Price
  double get totalPrice {
    return _items.fold(
      0,
      (total, item) => total + (item.price * item.quantity),
    );
  }
}