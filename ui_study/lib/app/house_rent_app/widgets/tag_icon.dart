import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TagIcon extends StatelessWidget {
  final Color bgColor;
  final String img;
  double? height;

  TagIcon(
      {super.key, required this.bgColor, required this.img, this.height = 17});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: CircleAvatar(
        child: SvgPicture.asset(
          img,
          height: height,
        ),
        backgroundColor: bgColor,
      ),
    );
  }
}
