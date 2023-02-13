import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_study/app/travel_app/model/travel.dart';
import 'controller.dart';

class TravelDetialPage extends GetView<TravelDetialController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TravelDetialController>(builder: (controller) {
      return Scaffold(
        body: Stack(
          children: [
            Container(
              height: 100,
              color: Colors.cyanAccent,
              // child: Text(controller.travelItem.name),
            ),
            CustomScrollView(
              slivers: [buildSliverHead(controller.travelItem, 300)],
            )
          ],
        ),
      );
    });
  }

  SliverPersistentHeader buildSliverHead(Travel travel, double expandedHeight) {
    return SliverPersistentHeader(
        delegate: DetailSliverDelegate(travel, expandedHeight));
  }
}

class DetailSliverDelegate extends SliverPersistentHeaderDelegate {
  final Travel travel;
  final double expandedHeight;

  DetailSliverDelegate(this.travel, this.expandedHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    throw Stack(
      children: [
        Opacity(
          opacity: 0.8,
          child: Image.asset(
            travel.url,
            width: MediaQuery.of(context).size.width,
            height: expandedHeight,
          ),
        )
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
