import 'package:flutter/material.dart';
import 'package:ui_study/app/house_rent_app/widgets/tag_icon.dart';

import '../model/house.dart';

class DetailAppBar extends StatelessWidget {
  final House house;

  const DetailAppBar({Key? key, required this.house}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.topCenter,
      height: 400,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(this.house.imageUrl),
        fit: BoxFit.fill,
      )),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TagIcon(
                bgColor: Colors.white.withOpacity(0.8),
                img: 'assets/icons/arrow.svg'),
            TagIcon(
                bgColor: Colors.pinkAccent.withOpacity(0.8),
                img: 'assets/icons/mark.svg')
          ],
        ),
      ),
    );
    // return Container(
    //   height: MediaQuery.of(context).size.height,
    //   child: Column(
    //     children: [
    //       Expanded(
    //           flex: 1,
    //           child: Container(
    //             decoration: BoxDecoration(
    //                 image: DecorationImage(
    //               image: AssetImage(this.house.imageUrl),
    //               fit: BoxFit.cover,
    //             )),
    //             child: SafeArea(
    //               child: Row(
    //
    //               ),
    //             ),
    //           )),
    //       Expanded(
    //           flex: 1,
    //           child: Container(
    //             color: Colors.pinkAccent,
    //           ))
    //     ],
    //   ),
    // );
  }
}
