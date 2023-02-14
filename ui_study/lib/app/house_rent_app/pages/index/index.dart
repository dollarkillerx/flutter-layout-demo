import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_study/app/travel_app/widgets/most_popular.dart';
import 'package:ui_study/app/travel_app/widgets/travel_blog.dart';
import 'controller.dart';

class HouseRentIndexPage extends GetView<HouseRentIndexController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HouseRentIndexController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          leading: Image.asset("assets/icons/menu.svg"),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("Hello world"),
        ),
      );
    });
  }

}

