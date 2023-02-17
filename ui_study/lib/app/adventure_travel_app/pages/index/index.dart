import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ui_study/app/adventure_travel_app/widgets/category_list.dart';
import '../../widgets/search_input_shadow.dart';
import 'controller.dart';

class AdventureTravelIndexPage extends GetView<AdventureTravelIndexController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdventureTravelIndexController>(builder: (controller) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildHeader(),
                SizedBox(
                  height: 15,
                ),
                SearchInputShadow(),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Explore the world \nwith us!",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CategoryList(),
              ],
            ),
          ),
        ),
      );
    });
  }

  SafeArea buildHeader() {
    return SafeArea(
        child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset("assets/icons/menu.svg"),
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/avatar.jpeg"),
          )
        ],
      ),
    ));
  }
}
