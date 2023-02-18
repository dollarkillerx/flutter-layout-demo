import 'package:flutter/material.dart';
import 'package:ui_study/app/course_learning_app/constants/colors.dart';

class Course {
  String img;
  String auth;
  String description;

  Course(this.img, this.auth, this.description);

  static List<Course> generateCourse() {
    return [
      Course("assets/images/landscape-gc7b2c3766_1920.jpg", "Luma Lanori",
          "Paint techniques"),
      Course("assets/images/pexels-ranger-zang-14110127.jpg", "Daniel didTo",
          "Mushroc"),
      Course("assets/images/4546073.jpg", "Luma Lanori", "Paint techniques"),
      Course(
          "assets/images/HD-wallpaper-hatsune-miku-wreath-dress-forest-anime-blue-eyes-nature-vocaloid-blue-hair-long-hair-twintails-tree-anime-girl-wet-flower.jpg",
          "Luma Lanori",
          "Paint techniques"),
      Course(
        "assets/images/HD-wallpaper-menma-tree-water-girl-anime-white-hair-nature-blue-eyes.jpg",
        "Paint techniques",
        "Paint techniques",
      )
    ];
  }
}

class CourseUnit {
  Color iconBorder; // 图标边框
  Color iconBg; // 图标背景
  Color iconColor; // 图标颜色
  IconData icon;
  String title;
  String description;
  Color moduleBorder;
  Color moduleBg;
  Color buttonColor;
  Color buttonFont;
  String time;
  String lesson;

  CourseUnit(
      this.iconBorder,
      this.iconBg,
      this.iconColor,
      this.icon,
      this.title,
      this.description,
      this.moduleBorder,
      this.moduleBg,
      this.buttonColor,
      this.buttonFont,
      this.time,
      this.lesson);

  static List<CourseUnit> generateUnit() {
    return [
      CourseUnit(
          Colors.orange,
          Colors.orange,
          Colors.white,
          Icons.play_arrow_rounded,
          "Unit 1",
          "How it all started.\nExplanation",
          CourseLearColors.kPrimaryLight,
          CourseLearColors.kPrimaryLight,
          CourseLearColors.kPrimary,
          CourseLearColors.kPrimary,
          "22 min",
          "2 lessons"),
      CourseUnit(
          CourseLearColors.kFontLight.withOpacity(0.3),
          Colors.white,
          CourseLearColors.kFontLight.withOpacity(0.7),
          Icons.lock_outline_rounded,
          "Unit 2",
          "What we didn\'t know\nabout catastrophe",
          CourseLearColors.kPrimaryLight,
          CourseLearColors.kPrimaryLight,
          CourseLearColors.kPrimary,
          CourseLearColors.kPrimary,
          "12 min",
          "3 lessons"),
      CourseUnit(
          Colors.orange,
          Colors.orange,
          Colors.white,
          Icons.play_arrow_rounded,
          "Unit 1",
          "How it all started.\nExplanation",
          CourseLearColors.kPrimaryLight,
          CourseLearColors.kPrimaryLight,
          CourseLearColors.kPrimary,
          CourseLearColors.kPrimary,
          "22 min",
          "2 lessons"),
      CourseUnit(
          Colors.orange,
          Colors.orange,
          Colors.white,
          Icons.play_arrow_rounded,
          "Unit 1",
          "How it all started.\nExplanation",
          CourseLearColors.kPrimaryLight,
          CourseLearColors.kPrimaryLight,
          CourseLearColors.kPrimary,
          CourseLearColors.kPrimary,
          "22 min",
          "2 lessons"),
    ];
  }
}
