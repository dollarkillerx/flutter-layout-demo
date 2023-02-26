import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_study/app/food_app/constants/colors.dart';
import 'controller.dart';

class FoodDetailPage extends GetView<FoodDetailController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FoodDetailController>(builder: (controller) {
      return Scaffold(
        backgroundColor: FoodColors.accentColor,
        appBar: buildAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 100),
              Container(
                height: MediaQuery.of(context).size.height - 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(45), topRight: Radius.circular(45))
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 30,
            child: Container(
              height: 45,
              width: 45,
              child: Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.black,
                size: 25,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          )
        ],
      ),
      actions: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              child: Container(
                height: 45,
                width: 45,
                margin: EdgeInsets.only(right: 30),
                child: Icon(
                  Icons.favorite_border_outlined,
                  color: Colors.black,
                  size: 25,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
