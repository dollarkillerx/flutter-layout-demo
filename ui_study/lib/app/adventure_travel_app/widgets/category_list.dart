import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_study/app/adventure_travel_app/model/model.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../common/routers/app_routes.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  final categoryList = ["New Popular", "Most viewd", "All places", "Near you"];
  int activationIndex = 0;
  final categoryItemList = [
    Place.generatePlace(),
    Place.generatePlace2(),
    Place.generatePlace(),
    Place.generatePlace2(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          buildHeader(),
          MasonryGridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            itemCount: categoryItemList.elementAt(activationIndex).length,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.toNamed(
                      AppRoutes.pathJoin(
                          [AppRoutes.AdventureTravel, AppRoutes.Detail]),
                      arguments: {
                        "place": categoryItemList
                            .elementAt(activationIndex)
                            .elementAt(index),
                      });
                },
                child: ImgCard(
                  title: categoryItemList
                      .elementAt(activationIndex)
                      .elementAt(index)
                      .title,
                  subtitle: categoryItemList
                      .elementAt(activationIndex)
                      .elementAt(index)
                      .subtitle,
                  img: categoryItemList
                      .elementAt(activationIndex)
                      .elementAt(index)
                      .imageUrl,
                  height: categoryItemList
                      .elementAt(activationIndex)
                      .elementAt(index)
                      .height,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  SizedBox buildHeader() {
    return SizedBox(
      height: 35,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Container(
                // color: Colors.black45.withOpacity(0.1),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      activationIndex = index;
                    });
                  },
                  child: Text(
                    categoryList.elementAt(index),
                    style: TextStyle(
                      fontSize: 20,
                      color:
                          activationIndex == index ? Colors.pink : Colors.black,
                      fontWeight: activationIndex == index
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
              ),
          separatorBuilder: (context, index) => SizedBox(
                width: 15,
              ),
          itemCount: categoryList.length),
    );
  }
}

class ImgCard extends StatelessWidget {
  final String img;
  final String title;
  final String subtitle;
  final double height;

  const ImgCard({
    super.key,
    required this.img,
    required this.title,
    required this.subtitle,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      height: height,
      decoration: BoxDecoration(
          color: Colors.grey,
          image: DecorationImage(
            image: AssetImage(img),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
