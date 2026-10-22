import 'package:flutter/material.dart';

class CartItem {
  final String name;
  final String image;
  final int price;
  int quantity;

  CartItem({
    required this.name,
    required this.image,
    required this.price,
    this.quantity = 1,
  });
}

class CartModel {
  static ValueNotifier<List<CartItem>> cartItems =
      ValueNotifier([]);

  static void addToCart({
    required String name,
    required String image,
    required int price,
  }) {
    List<CartItem> items = List.from(cartItems.value);

    int index = items.indexWhere(
      (item) => item.name == name,
    );

    if (index != -1) {
      items[index].quantity++;
    } else {
      items.add(
        CartItem(
          name: name,
          image: image,
          price: price,
        ),
      );
    }

    cartItems.value = items;
  }

  static void increase(int index) {
    List<CartItem> items = List.from(cartItems.value);
    items[index].quantity++;
    cartItems.value = items;
  }

  static void decrease(int index) {
    List<CartItem> items = List.from(cartItems.value);

    if (items[index].quantity > 1) {
      items[index].quantity--;
    } else {
      items.removeAt(index);
    }

    cartItems.value = items;
  }

  static int get totalPrice {
    int total = 0;

    for (var item in cartItems.value) {
      total += item.price * item.quantity;
    }

    return total;
  }
}