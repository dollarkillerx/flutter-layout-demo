import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchInputShadow extends StatelessWidget {
  const SearchInputShadow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 7,
            offset: Offset(1, 1),
          )
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          hintText: 'Search here...',
          prefixIcon: Container(
            padding: EdgeInsets.all(15),
            child: SvgPicture.asset('assets/icons/search.svg'),
          ),
          contentPadding: EdgeInsets.all(2),
        ),
      ),
    );
  }
}
