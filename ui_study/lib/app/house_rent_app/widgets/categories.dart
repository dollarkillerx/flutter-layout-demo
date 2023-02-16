import 'package:flutter/material.dart';
import 'package:ui_study/app/house_rent_app/model/house.dart';
import 'package:ui_study/app/house_rent_app/widgets/recommended_house.dart';

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
  final houses = [
    House.generateBestOffer(),
    House.generateRecommended(),
    House.generateBestOffer(),
    House.generateRecommended(),
  ];

  int currentSelect = 0; // 选中的index

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
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
                        color: currentSelect == index
                            ? Colors.purple
                            : Colors.black54,
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
        ),
        SizedBox(height: 20,),
        RecommendedHouse(houses: houses[currentSelect]),
        
      ],
    );
  }
}
