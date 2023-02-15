import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'controller.dart';

class HouseRentIndexPage extends GetView<HouseRentIndexController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HouseRentIndexController>(builder: (controller) {
      return Scaffold(
        // 默认AppBar 太大了
        // appBar: AppBar(
        //   leading: SvgPicture.asset('assets/icons/menu.svg'),
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   actions: [
        //     Container(
        //       width: kToolbarHeight,
        //       decoration: BoxDecoration(
        //         color: Colors.cyan,
        //         image: DecorationImage(
        //           image: ExactAssetImage("assets/images/avatar.jpeg"),
        //           fit: BoxFit.cover
        //         ),
        //         borderRadius: BorderRadius.circular(150)
        //       ),
        //     )
        //   ],
        //   title: Text("Hello world"),
        // ),
      );
    });
  }
}
