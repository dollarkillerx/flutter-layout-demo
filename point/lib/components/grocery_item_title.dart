import 'package:flutter/material.dart';

class GroceryItemTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  final MaterialColor color;
  void Function()? onPressed;

  GroceryItemTile(
      {
        super.key,
        required this.itemName,
        required this.itemPrice,
        required this.imagePath,
        required this.color,
        this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: color[100],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              imagePath,
              height: 64,
            ),
            Text(itemName),
            // Text(itemPrice)
            MaterialButton(
              onPressed: this.onPressed,
              color: color[800],
              child: Text("\$ " + itemPrice),
            )
          ],
        ),
      ),
    );
  }
}
