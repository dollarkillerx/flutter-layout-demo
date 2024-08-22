import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:point/models/card_model.dart';
import 'package:provider/provider.dart';

import '../components/grocery_item_title.dart';
import 'cart_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartPage()),
          )
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.shopping_bag, color: Colors.white,),
      ),
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 48),
                  // good morning
                  Text("Good Morning"),

                  SizedBox(height: 4),

                  // Let's order fresh items for you
                  Text(
                    "Let's order fresh items for you",
                    style: GoogleFonts.notoSerif(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // divider
                  Divider(
                    thickness: 2,
                  ),

                  SizedBox(
                    height: 24,
                  ),

                  Text(
                    "Fresh Items",
                    style: TextStyle(fontSize: 16),
                  ),

                  // fresh items + grid
                  Expanded(child:
                      Consumer<CartModel>(builder: (context, value, child) {
                    return GridView.builder(
                      padding: EdgeInsets.all(12),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 1 / 1.3),
                      itemCount: value.shopItems.length,
                      itemBuilder: (context, index) {
                        return GroceryItemTile(
                          itemName: value.shopItems[index][0],
                          itemPrice: value.shopItems[index][1],
                          imagePath: value.shopItems[index][2],
                          color: value.shopItems[index][3],
                        );
                      },
                    );
                  }))

                  // Expanded(
                  //     child: GridView.builder(
                  //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //             crossAxisCount: 2,
                  //         ),
                  //         itemBuilder: (context, index) {
                  //           return GroceryItemTile(
                  //             itemName: "Item $index",
                  //             itemPrice: "10",
                  //             imagePath: "lib/images/1f951.png",
                  //             color: Colors.deepPurpleAccent,
                  //           );
                  //         },
                  //     ),
                  // )
                  // Expanded(child: Container(
                  //   decoration: BoxDecoration(
                  //     color: Colors.grey[200],
                  //   ),
                  // ))
                ],
              ))),
    );
  }
}
