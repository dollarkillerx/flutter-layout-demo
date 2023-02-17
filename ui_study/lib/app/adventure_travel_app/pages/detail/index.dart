import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'controller.dart';

class AdventureTravelDetailPage
    extends GetView<AdventureTravelDetailController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdventureTravelDetailController>(builder: (controller) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [buildHeader(), buildTitle(), buildBody()],
          ),
        ),
      );
    });
  }

  Container buildBody() => Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "About",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "This week I made BUBBLE TROUBLE with Flutter from scratch. I didn't use any external packages and just made this from scratch :) Download the code from my websi",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black45,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.pink,
                width: 1,
              ))),
              child: Text(
                "Read me",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.pink,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildIoc(Colors.pinkAccent.shade100, "assets/icons/mark.svg"),
                  buildIoc(Colors.black12, "assets/icons/chat.svg"),
                  buildIoc(Colors.black12, "assets/icons/kitchen.svg"),
                  buildIoc(Colors.black12, "assets/icons/parking.svg"),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent.shade200,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: Text("Book Now"),
                ))
          ],
        ),
      );

  Container buildIoc(Color color, String img) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 7,
              offset: Offset(1, 1),
            )
          ]),
      padding: EdgeInsets.all(13),
      child: SvgPicture.asset(
        img,
        fit: BoxFit.cover,
      ),
    );
  }

  Container buildTitle() => Container(
        height: 100,
        width: double.infinity,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.place.title,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    controller.place.subtitle,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/mark.svg",
                        color: Colors.redAccent,
                        height: 16,
                      ),
                      Text(
                        "  4.8",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.pink.shade50,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(36),
              bottomRight: Radius.circular(36)),
        ),
      );

  Container buildHeader() {
    return Container(
      height: 340,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(controller.place.imageUrl),
          fit: BoxFit.fill,
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 20,
            child: SafeArea(
              child: Container(
                height: 40,
                width: 40,
                padding: EdgeInsets.all(9),
                child: SvgPicture.asset(
                  "assets/icons/arrow.svg",
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          Positioned(
              // bottom: -20,
              bottom: 5,
              right: 50,
              child: Container(
                height: 50,
                width: 50,
                padding: EdgeInsets.all(10),
                child: SvgPicture.asset(
                  "assets/icons/heart.svg",
                  fit: BoxFit.cover,
                  color: Colors.redAccent,
                ),
                decoration: BoxDecoration(
                    color: Colors.pink.shade50,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 7,
                        offset: Offset(1, 1),
                      )
                    ]),
              ))
        ],
      ),
    );
  }
}
