import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // logo
          // we delive grocerise at your doorstep
          Padding(
            padding: const EdgeInsets.only(
                left: 80, right: 80, bottom: 80, top: 160),
            child: Image.asset("lib/images/1f951.png"),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              "We deliver grocerise at your doorstep",
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSerif(),
              // style: TextStyle(
              //   fontSize: 40,
              //   fontWeight: FontWeight.bold,
              // ),
            ),
          ),
          Text("Fresh items everyday"),
          Spacer(),
          // button
          Container(
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.all(20),
            child: Text(
              "Get Started",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
