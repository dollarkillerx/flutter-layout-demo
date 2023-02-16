import 'package:flutter/material.dart';
import 'package:ui_study/app/house_rent_app/model/house.dart';
import 'package:ui_study/app/house_rent_app/widgets/recommended_house.dart';
import 'package:ui_study/app/house_rent_app/widgets/tag_icon.dart';

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
        SizedBox(
          height: 20,
        ),
        RecommendedHouse(houses: houses[currentSelect]),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Best Offer",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              "See Allr",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ],
        ),
        ...houses[currentSelect].map((e) => Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(15),
              height: 160,
              width: double.infinity,
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Container(
                          height: 160,
                          child: Image.asset(
                            e.imageUrl,
                            fit: BoxFit.fill,
                          ),
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                        )),
                    Expanded(
                        child: Stack(
                      children: [
                        Positioned(
                          top: 30,
                          child: Container(
                            width: 120,
                            padding: EdgeInsets.all(5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  e.name,
                                  style: TextStyle(
                                    fontSize: 20,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  e.address,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                  maxLines: 4,
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                            top: 0,
                            right: 0,
                            child: TagIcon(
                              bgColor: Colors.black26,
                              img: "assets/icons/heart.svg",
                            ))
                      ],
                    ))
                  ],
                ),
                decoration: BoxDecoration(
                    // color: Colors.black,
                    // borderRadius: BorderRadius.circular(10),
                    ),
              ),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
            ))
      ],
    );
  }
}
