import 'package:flutter/material.dart';
import 'package:ui_study/app/course_learning_app/model/model.dart';
import 'package:ui_study/app/course_learning_app/widgets/course_card_list.dart';
import '../constants/colors.dart';
import 'course_title.dart';

class HuListCard extends StatelessWidget {
  const HuListCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final courseList = Course.generateCourse();

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CourseTitle(title: "Top of the week"),
          SizedBox(
            height: 10,
          ),
          CourseCardList(
            courseList: courseList,
          ),
        ],
      ),
    );
  }
}
