import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_study/app/food_app/model/model.dart';

import '../../../common/routers/app_routes.dart';

class FoodList extends StatefulWidget {
  late int selected;
  final PageController pageController;

  FoodList({Key? key, required this.selected, required this.pageController})
      : super(key: key);

  @override
  State<FoodList> createState() => _FoodListState(selected, pageController);
}

class _FoodListState extends State<FoodList> {
  late int selected = 0;
  late PageController pageController;
  List<List<FoodModel>> foodModels = [
    FoodModel.generateFoods(),
    FoodModel.generateFoods(),
    FoodModel.generateFoods(),
    FoodModel.generateFoods(),
  ];

  _FoodListState(this.selected, this.pageController);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 30),
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            selected = index;
          });
          pageController.animateToPage(selected,
              duration: Duration(milliseconds: 300), curve: Curves.ease);
        },
        children: [
          ...foodModels.map((e) => ListView.separated(
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Get.toNamed(
                        AppRoutes.pathJoin(
                            [AppRoutes.Food, AppRoutes.Detail]),
                        arguments: {
                          "food": e.elementAt(index),
                        });
                  },
                  child: Container(
                    height: 150,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            padding: EdgeInsets.all(10),
                            child: Image.asset(e.elementAt(index).img)),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              e.elementAt(index).title,
                              maxLines: 2,
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              e.elementAt(index).about,
                              maxLines: 1,
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "\$ ${e.elementAt(index).price}",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )),
                        Icon(Icons.keyboard_arrow_right)
                      ],
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => SizedBox(
                  height: 10,
                ),
                itemCount: e.length,
              ))
        ],
      ),
    );
  }
}
