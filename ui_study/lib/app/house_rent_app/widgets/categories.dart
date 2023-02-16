import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final categoriesList = [
    "Top Recommended",
    "Near You ",
    "Agency Recommended",
    "Most Popular"
  ];

  int currentSelect = 0; // 选中的index

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  currentSelect = index;
                });
              },
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  categoriesList[index],
                  style: TextStyle(
                    fontSize: currentSelect == index ? 16 : 14,
                    fontWeight: currentSelect == index
                        ? FontWeight.bold
                        : FontWeight.w500,
                    color:
                        currentSelect == index ? Colors.purple : Colors.black54,
                  ),
                ),
                decoration: currentSelect == index
                    ? BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                        color: Colors.purple,
                        width: 3,
                      )))
                    : BoxDecoration(),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 15,
            );
          },
          itemCount: categoriesList.length),
    );
  }
}
