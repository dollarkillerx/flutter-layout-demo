import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_study/app/food_app/constants/colors.dart';
import 'controller.dart';

class FoodDetailPage extends GetView<FoodDetailController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FoodDetailController>(builder: (controller) {
      return Scaffold(
        backgroundColor: FoodColors.accentColor,
        appBar: buildAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 170),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: FoodColors.primaryColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45),
                        topRight: Radius.circular(45))),
                constraints: BoxConstraints(
                  minHeight:
                      MediaQuery.of(context).size.height - 100 - kToolbarHeight,
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    buildBody(controller),
                    Positioned(
                        top: -150,
                        left: 50,
                        child: Image.asset(controller.food.img))
                  ],
                ),
              )
            ],
          ),
        ),
        floatingActionButton: Container(
          width: 120,
          height: 56,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: RawMaterialButton(
            fillColor: FoodColors.accentColor,
            onPressed: () {},
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.shopping_bag_outlined,
                  size: 30,
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '1',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  Container buildBody(FoodDetailController controller) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 160),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            controller.food.title,
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      color: Colors.blue,
                      size: 30,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      controller.food.time,
                      style: TextStyle(fontSize: 22),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star_border_outlined,
                      color: Colors.yellow,
                      size: 30,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '${controller.food.star}',
                      style: TextStyle(fontSize: 22),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.local_fire_department_outlined,
                      color: Colors.red,
                      size: 30,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '${controller.food.kcal} kcal',
                      style: TextStyle(fontSize: 22),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.maxFinite,
            height: 40,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment(-0.3, 0),
                  child: Container(
                    width: 120,
                    height: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          '\$',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          controller.food.price.toString(),
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0.3, 0),
                  child: Container(
                    height: double.maxFinite,
                    width: 120,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                        color: FoodColors.accentColor,
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '-',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Text(
                            '1',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Text(
                          '+',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          // SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.all(30),
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ingredients',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 120,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Container(
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)),
                            child: Column(
                              children: [
                                Image.asset(controller.food.ingredients
                                    .elementAt(index)
                                    .img),
                                Text(controller.food.ingredients
                                    .elementAt(index)
                                    .text),
                              ],
                            ),
                          ),
                      separatorBuilder: (context, index) => Container(
                            width: 10,
                          ),
                      itemCount: controller.food.ingredients.length),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  controller.food.about,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                )
              ],
            ),
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
                  Icons.favorite_border_outlined,
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
