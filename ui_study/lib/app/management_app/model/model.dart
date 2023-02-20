import 'package:flutter/material.dart';
import 'package:ui_study/app/management_app/constants/colors.dart';

class Task {
  IconData? iconData;
  String? title;
  Color? bgColor;
  Color? iconColor;
  Color? btnColor;
  num? left;
  num? done;
  bool? isLast;

  Task(
      {this.iconData,
      this.title,
      this.bgColor,
      this.iconColor,
      this.btnColor,
      this.left,
      this.done,
      this.isLast = false});

  static List<Task> generateTasks() {
    return [
      Task(
          iconData: Icons.person_rounded,
          title: 'Personal',
          bgColor: ManagementColors.YellowLight,
          iconColor: ManagementColors.kYellowDark,
          btnColor: ManagementColors.kYellow,
          left: 3,
          done: 1),
      Task(
          iconData: Icons.cases_rounded,
          title: 'Work',
          bgColor: ManagementColors.kRedLight,
          iconColor: ManagementColors.kRedDark,
          btnColor: ManagementColors.kRed,
          left: 3,
          done: 1),
      Task(
          iconData: Icons.favorite_rounded,
          title: 'Health',
          bgColor: ManagementColors.kBlueLight,
          iconColor: ManagementColors.kBlueDark,
          btnColor: ManagementColors.kBlue,
          left: 0,
          done: 0),
      Task(isLast: true),
    ];
  }
}
