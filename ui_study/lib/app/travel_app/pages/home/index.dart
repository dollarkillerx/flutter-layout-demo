import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_study/app/travel_app/widgets/most_popular.dart';
import 'package:ui_study/app/travel_app/widgets/travel_blog.dart';
import 'controller.dart';

class TravelHomePage extends GetView<TravelHomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TravelHomeController>(builder: (controller) {
      return Scaffold(
        appBar: TravelAppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // color: Colors.amber,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text(
                "Travel Blog",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w400),
              ),
            ),
            listCat(),
            Container(
              // color: Colors.blue.withOpacity(0.5),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Most Popular",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "View all",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.orange,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
            footer()
          ],
        ),
      );
    });
  }

  Expanded footer() {
    return Expanded(
      flex: 1,
      child: Container(
        child: MostPopular(),
      ),
    );
  }

  Expanded listCat() {
    return Expanded(
      flex: 2,
      child: TravelBlog(),
    );
  }
}

class TravelAppBar extends StatelessWidget with PreferredSizeWidget {
  const TravelAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Travel App Demo",
        style: TextStyle(color: Colors.red.withOpacity(0.7)),
      ),
      automaticallyImplyLeading: false,
      centerTitle: true,
      elevation: 0,
      // 透明需要搭配 elevation  去掉线条
      backgroundColor: Colors.transparent,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.menu,
            color: Colors.black,
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
