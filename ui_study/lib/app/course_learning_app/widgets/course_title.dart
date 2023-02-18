import 'package:flutter/material.dart';

class CourseTitle extends StatelessWidget {
  final String title;

  const CourseTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "View all",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
