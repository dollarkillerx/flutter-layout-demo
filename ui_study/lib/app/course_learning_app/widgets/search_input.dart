import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../constants/colors.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      child: TextField(
        cursorColor: CourseLearColors.kFontLight,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(18),
          fillColor: CourseLearColors.kFontLight.withOpacity(0.1),
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          hintText: 'Search for history, classes,...',
          suffixIcon: Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(10),
            child: SvgPicture.asset(
              'assets/icons/search.svg',
              color: Colors.white,
              height: 10,
            ),
            decoration: BoxDecoration(
                color: Colors.yellow.shade800,
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
          border:
              Border.all(color: CourseLearColors.kFontLight.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 1,
              offset: Offset(1, 1),
            )
          ]),
    );
  }
}
