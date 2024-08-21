import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:point/models/card_model.dart';
import 'package:provider/provider.dart';

import '../components/grocery_item_title.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  
                  SizedBox(height: 24,),
                  
                  Text("Fresh Items", style: TextStyle(fontSize: 16),),

                  // fresh items + grid
                  Expanded(child: Consumer<CartModel> {
                    return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) {
                          return GroceryItemTile(
                            itemName: "Item $index",
                            itemPrice: "10",
                            imagePath: "lib/images/1f951.png",
                            color: Colors.deepPurpleAccent,
                          );
                        },
                    );
                  })
                  
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
