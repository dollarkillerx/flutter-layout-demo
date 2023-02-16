import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../widgets/detail_app_ba.dart';
import 'controller.dart';

class HouseRentDetailPage extends GetView<HouseRentDetialController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HouseRentDetialController>(builder: (controller) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              DetailAppBar(
                house: controller.house,
              ),
              buildBody()
            ],
          ),
        ),
      );
    });
  }

  Container buildBody() {
    return Container(
      // color: Colors.green,
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildIntro(),
          Container(
            child: Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      Expanded(
                          child: FourGridCard(
                              icon: "assets/icons/bedroom.svg",
                              text1: "5 Bedroom",
                              text2: "3 Master Bedroom")),
                      Expanded(
                          child: FourGridCard(
                              icon: "assets/icons/bathroom.svg",
                              text1: "5 Bedroom",
                              text2: "3 Toilet")),
                    ],
                  ),
                  height: 65,
                ),
                FourGrid(),
                SizedBox(
                  height: 10,
                ),
                buildAbout(),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text("Book Now"),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buildAbout() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "About",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "This series is made to explain how to build cross platform phone games and apps using Flutter and Flame (for both Android and iOS).",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black45,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }

  Column buildIntro() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          controller.house.name,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          controller.house.address,
          style: TextStyle(
            fontSize: 18,
            color: Colors.black45,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "50000 sqft",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black45,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        RichText(
            text: TextSpan(
          children: [
            TextSpan(
              text: '\$4440  ',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "Fer Month",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black45,
              ),
            )
          ],
        )),
        // Row(
        //   children: [
        //     Text(
        //       '\$4440  ',
        //       style: TextStyle(
        //         fontSize: 18,
        //         color: Colors.black,
        //         fontWeight: FontWeight.bold,
        //       ),
        //     ),
        //     Text(
        //       "Fer Month",
        //       style: TextStyle(
        //         fontSize: 18,
        //         color: Colors.black45,
        //       ),
        //     ),
        //   ],
        // )
      ],
    );
  }
}

class FourGrid extends StatelessWidget {
  const FourGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
              child: FourGridCard(
                  icon: "assets/icons/kitchen.svg",
                  text1: "2 Kitchen",
                  text2: "123 sqft")),
          Expanded(
              child: FourGridCard(
                  icon: "assets/icons/parking.svg",
                  text1: "2 Parking",
                  text2: "180 sqft")),
        ],
      ),
      height: 60,
    );
  }
}

class FourGridCard extends StatelessWidget {
  final String icon;
  final String text1;
  final String text2;

  const FourGridCard({
    super.key,
    required this.icon,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
              child: SvgPicture.asset(
            icon,
            height: 30,
          )),
          Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text1,
                    style: TextStyle(color: Colors.black45, fontSize: 17),
                  ),
                  Text(
                    text2,
                    style: TextStyle(color: Colors.black45, fontSize: 14),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
