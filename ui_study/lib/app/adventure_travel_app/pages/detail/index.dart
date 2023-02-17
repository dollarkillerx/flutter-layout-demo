import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';

class AdventureTravelDetailPage
    extends GetView<AdventureTravelDetailController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdventureTravelDetailController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Container(
            padding: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              color: Colors.cyan,
              borderRadius: BorderRadius.circular(20)
            ),
          ),
        ),
        body: Column(
          children: [
            Text(controller.place.imageUrl)
          ],
        ),
      );
    });
  }
}
