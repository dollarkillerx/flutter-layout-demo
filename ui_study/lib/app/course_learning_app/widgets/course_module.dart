import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_study/app/course_learning_app/constants/colors.dart';
import 'package:ui_study/app/course_learning_app/widgets/course_card_list.dart';

import '../model/model.dart';

class CourseModule extends StatelessWidget {
  final List<CourseUnit> courseUnitList;

  const CourseModule({
    super.key,
    required this.courseUnitList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "The progress",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: SvgPicture.asset("assets/icons/menu.svg"),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          // ListView.builder(
          //     shrinkWrap: true,
          //     itemCount: courseUnitList.length,
          //     itemBuilder: (context, index) =>
          //         buildCard(courseUnitList.elementAt(index)))
          ...courseUnitList.map((e) => buildCard(e))
        ],
      ),
    );
  }

  Container buildCard(CourseUnit unit) {
    return Container(
      height: 180,
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: unit.iconBorder, width: 2),
                          color: unit.iconBg,
                          shape: BoxShape.circle),
                      child: Icon(
                        unit.icon,
                        size: 30,
                        color: unit.iconColor,
                      ),
                      padding: EdgeInsets.all(8),
                    ),
                    Expanded(
                        child: Column(
                      children: List.generate(
                          20,
                          (index) => Expanded(
                                  child: Container(
                                width: 2,
                                color: index % 2 == 0
                                    ? Colors.transparent
                                    : unit.iconBorder,
                              ))),
                    ))
                  ],
                ),
              )),
          Expanded(
              flex: 5,
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: unit.moduleBg,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            unit.title,
                            style: TextStyle(
                                color: CourseLearColors.kFontLight,
                                fontSize: 16),
                          ),
                          Text(
                            "**",
                            style: TextStyle(
                                color: CourseLearColors.kFontLight,
                                fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        unit.description,
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          buildButton(Icon(Icons.timer), unit, unit.time),
                          SizedBox(
                            width: 10,
                          ),
                          buildButton(Icon(Icons.radio_button_checked), unit,
                              unit.lesson),
                        ],
                      )
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Container buildButton(Icon icon, CourseUnit unit, String text) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: unit.buttonColor,
      ),
      child: Row(
        children: [icon, Text(text)],
      ),
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
    );
  }
}
