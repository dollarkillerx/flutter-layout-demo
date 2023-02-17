import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_study/app/house_rent_app/widgets/categories.dart';
import 'package:ui_study/app/house_rent_app/widgets/custom_app_bar.dart';
import 'package:ui_study/app/house_rent_app/widgets/custorm_bottom_navigation_bar.dart';
import 'package:ui_study/app/house_rent_app/widgets/search_input.dart';
import 'controller.dart';

class HouseRentIndexPage extends GetView<HouseRentIndexController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HouseRentIndexController>(builder: (controller) {
      return Scaffold(
        // 默认AppBar 太大了
        // appBar: AppBar(
        //   leading: SvgPicture.asset('assets/icons/menu.svg'),
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   actions: [
        //     Container(
        //       width: kToolbarHeight,
        //       decoration: BoxDecoration(
        //         color: Colors.cyan,
        //         image: DecorationImage(
        //           image: ExactAssetImage("assets/images/avatar.jpeg"),
        //           fit: BoxFit.cover
        //         ),
        //         borderRadius: BorderRadius.circular(150)
        //       ),
        //     )
        //   ],
        //   title: Text("Hello world"),
        // ),
        appBar: CustomAppBar(),
        // backgroundColor: Theme.of(context).colorScheme.background,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          margin: EdgeInsets.only(top: 6),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildWelcomeText(),
                SizedBox(
                  height: 15,
                ),
                SearchInput(),
                SizedBox(
                  height: 15,
                ),
                Categories()
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(),
      );
    });
  }

  Column buildWelcomeText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hello Raihan!',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          'Find your sweet Home',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
