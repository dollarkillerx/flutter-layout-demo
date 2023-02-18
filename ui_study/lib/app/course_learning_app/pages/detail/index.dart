import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_study/app/course_learning_app/constants/colors.dart';
import '../../model/model.dart';
import '../../widgets/course_module.dart';
import 'controller.dart';

class CourseLearningDetailPage extends GetView<CourseLearningDetailController> {
  @override
  Widget build(BuildContext context) {
    final List<CourseUnit> courseUnitList = CourseUnit.generateUnit();

    return GetBuilder<CourseLearningDetailController>(builder: (controller) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              buildHeader(controller),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    buildTitle(),
                    SizedBox(
                      height: 15,
                    ),
                    CourseModule(
                      courseUnitList: courseUnitList,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  Container buildTitle() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/avatar.jpeg"),
              ),
              Text(
                "  Rona Dida",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "  *  ",
                style: TextStyle(fontSize: 18),
              ),
              Text(
                "1h 35 min",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "The art of speech",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "How we developed speech and how it became such a powerful tool, let's see.",
            style: TextStyle(
              fontSize: 21,
              color: CourseLearColors.kFontLight,
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  Container buildHeader(CourseLearningDetailController controller) {
    return Container(
      height: 360,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(controller.course.img),
                  fit: BoxFit.cover,
                ),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(40))),
          ),
          Positioned(
            bottom: -30,
            right: 50,
            child: Container(
              alignment: Alignment.center,
              height: 60,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.orange.shade600,
                  borderRadius: BorderRadius.circular(15)),
              child: Text(
                "Start class",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
              child: SafeArea(
            child: Container(
              height: 50,
              width: 50,
              margin: EdgeInsets.only(left: 20),
              padding: EdgeInsets.only(left: 5),
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(15)),
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                iconSize: 20,
              ),
            ),
          )),
          Positioned(
              right: 20,
              child: SafeArea(
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(15)),
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.bookmark,
                      color: Colors.white,
                    ),
                    iconSize: 20,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
