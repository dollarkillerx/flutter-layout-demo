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
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  automaticallyImplyLeading: false,
                  expandedHeight: 300,
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.pin, // δΈζ»ζζ
                    background: Container(
                      color: Colors.amber,
                      child: Stack(
                        children: [
                          Image.asset(
                            controller.travelItem.url,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            bottom: -1,
                            child: Container(
                                height: 30,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30)))),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: buildBody(context),
                )
              ],
            ),
            Container(
              height: kToolbarHeight, // AppBar ηι«εΊ¦
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
          ],
        ),
      );
    });
  }

  Container buildBody(BuildContext context) {
    final textList = Travel.generateMostBlog();

    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Column(
          children: [
            buildHomeHeader(),
            SizedBox(
              height: 20,
            ),
            Text(
              "ζ Ήζ?δ½ ε½εεΌεζΊε¨ηε±εΉε°Ίε―ΈοΌζ¨‘ζε¨ζ¨‘ζεΊζ₯ηι«ε―εΊ¦ε±εΉηθ?Ύε€ε―θ½δΌζΊ’εΊδ½ ηε±εΉοΌδ½ ε―δ»₯θ°ζ΄ζ¨‘ζε¨ηθΎΉθ§ζ₯ζε¨ζΉεζ―δΎοΌε¦ζδ½ ηεΌεζΊεθΎ¨ηεΎι«ηθ―οΌδΉε―δ»₯ιθΏθεδΈ­η Window > Physical Size or Window > Pixel Accurate ιι‘Ήζ₯ζ΄ζΉζ¨‘ζε¨ηηΌ©ζΎζ―δΎγ",
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
                  scrollDirection: Axis.horizontal, // ζ°΄εΉ³ζΉεζ»ε¨
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
              "ζ Ήζ?δ½ ε½εεΌεζΊε¨ηε±εΉε°Ίε―ΈοΌζ¨‘ζε¨ζ¨‘ζεΊζ₯ηι«ε―εΊ¦ε±εΉηθ?Ύε€ε―θ½δΌζΊ’εΊδ½ ηε±εΉοΌδ½ ε―δ»₯θ°ζ΄ζ¨‘ζε¨ηθΎΉθ§ζ₯ζε¨ζΉεζ―δΎοΌε¦ζδ½ ηεΌεζΊεθΎ¨ηεΎι«ηθ―οΌδΉε―δ»₯ιθΏθεδΈ­η Window > Physical Size or Window > Pixel Accurate ιι‘Ήζ₯ζ΄ζΉζ¨‘ζε¨ηηΌ©ζΎζ―δΎγζ Ήζ?δ½ ε½εεΌεζΊε¨ηε±εΉε°Ίε―ΈοΌζ¨‘ζε¨ζ¨‘ζεΊζ₯ηι«ε―εΊ¦ε±εΉηθ?Ύε€ε―θ½δΌζΊ’εΊδ½ ηε±εΉοΌδ½ ε―δ»₯θ°ζ΄ζ¨‘ζε¨ηθΎΉθ§ζ₯ζε¨ζΉεζ―δΎοΌε¦ζδ½ ηεΌεζΊεθΎ¨ηεΎι«ηθ―οΌδΉε―δ»₯ιθΏθεδΈ­η Window > Physical Size or Window > Pixel Accurate ιι‘Ήζ₯ζ΄ζΉζ¨‘ζε¨ηηΌ©ζΎζ―δΎγζ Ήζ?δ½ ε½εεΌεζΊε¨ηε±εΉε°Ίε―ΈοΌζ¨‘ζε¨ζ¨‘ζεΊζ₯ηι«ε―εΊ¦ε±εΉηθ?Ύε€ε―θ½δΌζΊ’εΊδ½ ηε±εΉοΌδ½ ε―δ»₯θ°ζ΄ζ¨‘ζε¨ηθΎΉθ§ζ₯ζε¨ζΉεζ―δΎοΌε¦ζδ½ ηεΌεζΊεθΎ¨ηεΎι«ηθ―οΌδΉε―δ»₯ιθΏθεδΈ­η Window > Physical Size or Window > Pixel Accurate ιι‘Ήζ₯ζ΄ζΉζ¨‘ζε¨ηηΌ©ζΎζ―δΎγζ Ήζ?δ½ ε½εεΌεζΊε¨ηε±εΉε°Ίε―ΈοΌζ¨‘ζε¨ζ¨‘ζεΊζ₯ηι«ε―εΊ¦ε±εΉηθ?Ύε€ε―θ½δΌζΊ’εΊδ½ ηε±εΉοΌδ½ ε―δ»₯θ°ζ΄ζ¨‘ζε¨ηθΎΉθ§ζ₯ζε¨ζΉεζ―δΎοΌε¦ζδ½ ηεΌεζΊεθΎ¨ηεΎι«ηθ―οΌδΉε―δ»₯ιθΏθεδΈ­η Window > Physical Size or Window > Pixel Accurate ιι‘Ήζ₯ζ΄ζΉζ¨‘ζε¨ηηΌ©ζΎζ―δΎγζ Ήζ?δ½ ε½εεΌεζΊε¨ηε±εΉε°Ίε―ΈοΌζ¨‘ζε¨ζ¨‘ζεΊζ₯ηι«ε―εΊ¦ε±εΉηθ?Ύε€ε―θ½δΌζΊ’εΊδ½ ηε±εΉοΌδ½ ε―δ»₯θ°ζ΄ζ¨‘ζε¨ηθΎΉθ§ζ₯ζε¨ζΉεζ―δΎοΌε¦ζδ½ ηεΌεζΊεθΎ¨ηεΎι«ηθ―οΌδΉε―δ»₯ιθΏθεδΈ­η Window > Physical Size or Window > Pixel Accurate ιι‘Ήζ₯ζ΄ζΉζ¨‘ζε¨ηηΌ©ζΎζ―δΎγ",
              style: TextStyle(color: Colors.grey),
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
            width: MediaQuery.of(context).size.width, // ζζ»‘ε?½εΊ¦
            height: expandedHeight, // θ?Ύε?ι«εΊ¦
            fit: BoxFit.cover, // θ£εͺ
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
