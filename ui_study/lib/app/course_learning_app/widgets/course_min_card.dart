import 'package:flutter/material.dart';
import 'package:ui_study/app/course_learning_app/constants/colors.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'course_title.dart';

class CourseMinCard extends StatelessWidget {
  const CourseMinCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CourseTitle(title: "Currently active"),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: CourseLearColors.kFontLight.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(
                            "assets/images/HD-wallpaper-menma-tree-water-girl-anime-white-hair-nature-blue-eyes.jpg"),
                        fit: BoxFit.cover,
                      )),
                )),
                Expanded(
                    flex: 2,
                    child: Container(
                      // alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Symetry theory",
                            style: TextStyle(fontSize: 22),
                          ),
                          Text(
                            "2 lessond left",
                            style: TextStyle(
                                fontSize: 16,
                                color: CourseLearColors.kFontLight),
                          ),
                        ],
                      ),
                    )),
                Expanded(
                    child: Container(
                  child: CircularPercentIndicator(
                    radius: 33,
                    lineWidth: 8.0,
                    percent: 0.61,
                    center: Text(
                      "61%",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    progressColor: Colors.orange,
                  ),
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
