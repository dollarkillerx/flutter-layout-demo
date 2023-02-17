import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_study/common/routers/app_routes.dart';
import 'package:ui_study/pages/home/controller.dart';
import '../../widgets/view_card.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        appBar: BrnAppBar(
          automaticallyImplyLeading: false,
          brightness: Brightness.dark,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Ui Study",
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
            ViewCard(
              img: "assets/images/img1.png",
              title: "Travel App",
              description: "旅游APP",
              onTap: () {
                Get.toNamed(AppRoutes.Travel);
              },
            ),
            ViewCard(
              img: "assets/images/img2.png",
              title: "House Rent App",
              description: "房屋租赁App",
              onTap: () {
                Get.toNamed(AppRoutes.HouseRent);
              },
            ),
            ViewCard(
              img: "assets/images/img3.png",
              title: "Adventure Travel App",
              description: "探险App",
              onTap: () {
                Get.toNamed(AppRoutes.HouseRent);
              },
            ),
          ],
        ),
      );
    });
  }
}

