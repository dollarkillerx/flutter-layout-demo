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
  List<Map<String, dynamic>>? desc;
  bool? isLast;

  Task(
      {this.iconData,
      this.title,
      this.bgColor,
      this.iconColor,
      this.btnColor,
      this.left,
      this.done,
      this.desc,
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
          desc: [
            {
              'time': '9:00 am',
              'title': 'Go for a walk with dog',
              'slot': '9:00 - 10:00',
              'tlColor': ManagementColors.kRedDark,
              'bgColor': ManagementColors.kRedLight,
            },
            {
              'time': '10:00 am',
              'title': 'Shot on Drible',
              'slot': '10 :00 - 12:00',
              'tlColor': ManagementColors.kBlueDark,
              'bgColor': ManagementColors.kBlueLight,
            },
            {
              'time': '11:00 am',
              'title': '',
              'slot': '',
              'tlColor': ManagementColors.kBlueDark,
            },
            {
              'time': '12:00 am',
              'title': '',
              'slot': '',
              'tlColor': Colors.grey.withOpacity(0.3),
            },
            {
              'time': '1:00 pm',
              'title': '',
              'slot': '',
              'tlColor': Colors.grey.withOpacity(0.3),
            },
            {
              'time': '2:00 pm',
              'title': 'Call with client',
              'slot': '2:00 pm - 3:00 pm',
              'tlColor': Colors.orange,
              'bgColor': Colors.orange.withOpacity(0.8),
            },
            {
              'time': '3:00 pm',
              'title': '',
              'slot': '',
              'tlColor': Colors.    grey.withOpacity(0.3),
            },
          ],
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
