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
            CustomScrollView(
              slivers: [buildSliverHead(controller.travelItem, 300, 50)],
            ),
            Container(
              height: kToolbarHeight, // AppBar 的高度
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Icon(Icons.arrow_back, color: Colors.white),
                    onTap: () {
                      Get.back();
                    },
                  ),
                  Icon(Icons.menu, color: Colors.white),
                ],
              ),
            ),
            Positioned(bottom: 0, child: buildBody(context)),
          ],
        ),
      );
    });
  }

  Container buildBody(BuildContext context) {
    final textList = Travel.generateMostBlog();

    return Container(
      height: MediaQuery.of(context).size.height - 270,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Container(
        padding: EdgeInsets.only(top: 40, left: 30, right: 30),
        child: Column(
          children: [
            buildHomeHeader(),
            SizedBox(
              height: 20,
            ),
            Text(
              "根据你当前开发机器的屏幕尺寸，模拟器模拟出来的高密度屏幕的设备可能会溢出你的屏幕，你可以调整模拟器的边角来拖动改变比例，如果你的开发机分辨率很高的话，也可以通过菜单中的 Window > Physical Size or Window > Pixel Accurate 选项来更改模拟器的缩放比例。",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Featured",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                Text(
                  "View all",
                  style: TextStyle(color: Colors.orange),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
                height: 70,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal, // 水平方向滑动
                  itemCount: textList.length,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      textList.elementAt(index).url,
                      height: 70,
                      width: 70,
                      fit: BoxFit.cover,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 10);
                  },
                )),
            SizedBox(
              height: 20,
            ),
            Text(
              "根据你当前开发机器的屏幕尺寸，模拟器模拟出来的高密度屏幕的设备可能会溢出你的屏幕，你可以调整模拟器的边角来拖动改变比例，如果你的开发机分辨率很高的话，也可以通过菜单中的 Window > Physical Size or Window > Pixel Accurate 选项来更改模拟器的缩放比例。",
              style: TextStyle(
                  color: Colors.grey, overflow: TextOverflow.ellipsis),
            ),
          ],
        ),
      ),
    );
  }

  Row buildHomeHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ClipOval(
              child: Image.asset(
                "assets/images/bottom1.jpg",
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "John Doe",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                Text(
                  "Writter, Wonderlust",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black45,
                  ),
                )
              ],
            ),
          ],
        ),
        Icon(Icons.share)
      ],
    );
  }

  SliverPersistentHeader buildSliverHead(
      Travel travel, double expandedHeight, double roundedContainerHeight) {
    return SliverPersistentHeader(
        delegate: DetailSliverDelegate(
            travel, expandedHeight, roundedContainerHeight));
  }
}

class DetailSliverDelegate extends SliverPersistentHeaderDelegate {
  final Travel travel;
  final double expandedHeight;
  final double roundedContainerHeight;

  DetailSliverDelegate(
      this.travel, this.expandedHeight, this.roundedContainerHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.8,
          child: Image.asset(
            travel.url,
            width: MediaQuery.of(context).size.width, // 撑满宽度
            height: expandedHeight, // 设定高度
            fit: BoxFit.cover, // 裁剪
          ),
        ),
        Positioned(
            bottom: 35,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  travel.name,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  travel.location,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ],
            )),
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
