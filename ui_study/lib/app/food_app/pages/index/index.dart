import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ui_study/app/food_app/constants/colors.dart';
import 'package:ui_study/app/food_app/widgets/food_list.dart';
import '../../widgets/list_button.dart';
import 'controller.dart';

class FoodIndexPage extends GetView<FoodIndexController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FoodIndexController>(builder: (controller) {
      return Scaffold(
        backgroundColor: FoodColors.primaryColor,
        appBar: buildAppBar(),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              buildHeaderCard(),
              SizedBox(
                height: 20,
              ),
              ListButton(),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: FoodList(
                  selected: controller.selected,
                  pageController: controller.pageController.value,
                ),
              ),
              Container(
                height: 60,
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: SmoothPageIndicator(
                  controller: controller.pageController.value,
                  count: 4,
                  effect: CustomizableEffect(
                      dotDecoration: DotDecoration(
                        width: 8,
                        height: 8,
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      activeDotDecoration: DotDecoration(
                          width: 10,
                          height: 10,
                          borderRadius: BorderRadius.circular(10),
                          color: FoodColors.accentColor,
                          dotBorder: DotBorder(
                            color: FoodColors.primaryColor,
                            padding: 2,
                            width: 2,
                          ))),
                  onDotClicked: (index) {
                    controller.pageController.value.animateToPage(index,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease);
                  },
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: FoodColors.accentColor,
          elevation: 2,
          child: Icon(Icons.shopping_bag_outlined, color: Colors.black, size: 30,),
        ),
      );
    });
  }

  Container buildHeaderCard() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Restaurant",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Container(
                    child: Text(
                      "20-30 min",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "2.4km",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Restaurant",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "\"Orange sandwiches is delicious\"",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          Column(
            children: [
              ClipRRect(
                child: Image.asset("assets/images/res_logo.png"),
                borderRadius: BorderRadius.circular(10),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Icon(
                    Icons.star_border,
                    color: Colors.yellow,
                    size: 35,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "4.7",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 30,
            child: Container(
              height: 45,
              width: 45,
              child: Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.black,
                size: 25,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          )
        ],
      ),
      actions: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              child: Container(
                height: 45,
                width: 45,
                margin: EdgeInsets.only(right: 30),
                child: Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 25,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
