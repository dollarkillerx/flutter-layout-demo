import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List _shopItems = [
    ["Avocado", "4.00", "lib/images/1f951.png", Colors.green],
    ["Chicken", "4.00", "lib/images/1f414.png", Colors.yellow],
    ["Banana", "4.00", "lib/images/banana.png", Colors.brown],
    ["Water", "4.00", "lib/images/1f30a.png", Colors.blue],
  ];

  List _cartItems = [];

  get shopItems => _shopItems;

  get cartItems => _cartItems;

  void addItemToCart(int index) { // index of the item in the shop items lis
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // calculate total price
  String calculateTotal() {
    double total = 0;
    _cartItems.forEach((element) {
      total += double.parse(element[1]);
    });
    return total.toStringAsFixed(2);
  }
}