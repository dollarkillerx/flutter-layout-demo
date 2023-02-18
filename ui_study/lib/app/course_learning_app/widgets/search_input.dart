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
            padding: EdgeInsets.all(15),
            child: SvgPicture.asset('assets/icons/search.svg'),
            decoration: BoxDecoration(),
          ),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          blurRadius: 1,
          offset: Offset(1, 1),
        )
      ]),
    );
  }
}
