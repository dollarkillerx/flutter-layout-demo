import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ui_study/app/course_learning_app/constants/colors.dart';
import '../../widgets/hu_list_card.dart';
import 'controller.dart';
import '../../widgets/search_input.dart';

class CourseLearningIndexPage extends GetView<CourseLearningIndexController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CourseLearningIndexController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: CourseLearColors.kBackground,
          elevation: 0,
          centerTitle: false,
          title: Container(
            padding: EdgeInsets.only(left: 0),
            child: Text(
              "Hello Mark!",
              style: TextStyle(
                color: CourseLearColors.kFontLight,
                fontSize: 16,
              ),
            ),
          ),
          actions: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, right: 20),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      // color: Colors.pinkAccent,
                      border: Border.all(
                          color: CourseLearColors.kFontLight.withOpacity(0.3),
                          width: 2),
                      borderRadius: BorderRadius.circular(15)),
                  child: SvgPicture.asset(
                    "assets/icons/notification.svg",
                    width: 30,
                  ),
                )
              ],
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              buildHeader(),
              SizedBox(
                height: 10,
              ),
              HuListCard()
            ],
          ),
        ),
      );
    });
  }

  Container buildHeader() => Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Let's boost your \nbrain power ✨",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            SearchInput()
          ],
        ),
      );
}
