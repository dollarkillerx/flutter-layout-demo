import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottomBarItem = [
      'home',
      'home_search',
      'notification',
      'chat',
      'home_mark'
    ];

    return Container(
      height: 50,
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
                color: Colors.green.withOpacity(0.25),
                spreadRadius: 1,
                blurRadius: 7,
                offset: Offset(0, 3))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ...bottomBarItem
              .map((e) => Container(
                    child: SvgPicture.asset(
                      'assets/icons/$e.svg',
                      color: Colors.pinkAccent.withOpacity(0.8),
                    ),
                  ))
              .toList()
        ],
      ),
    );
  }
}
