import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List _shopItems = [
    ["Avocado", "4.00", "assets/images/1f951.png", Colors.green],
    ["Chicken", "4.00", "assets/images/1f414.png", Colors.yellow],
    ["Banana", "4.00", "assets/images/banana.png", Colors.brown],
    ["Water", "4.00", "assets/images/1f30a.png", Colors.blue],
  ];

  get shopItems => _shopItems;
}