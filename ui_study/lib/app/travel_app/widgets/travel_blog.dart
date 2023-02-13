import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_study/app/travel_app/model/travel.dart';
import 'package:ui_study/common/routers/app_routes.dart';

class TravelBlog extends StatelessWidget {
  final _list = Travel.generateTravelBlog();
  final _pageCtrl = PageController(
      viewportFraction:
          0.9); // PageView 默认是占满整个内容区域的，如果想让两块内容显示在一屏内，就需要设置 viewportFraction 属性

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        PageView.builder(
            controller: _pageCtrl,
            itemCount: _list.length,
            itemBuilder: (context, index) {
              var travelItem = _list.elementAt(index);
              return GestureDetector(
                // GestureDetector 手势识别
                onTap: () {
                  Get.toNamed(
                      AppRoutes.pathJoin(
                          [AppRoutes.Travel, AppRoutes.TravelDetail]),
                      arguments: {
                        "travelItem": travelItem,
                      });
                },
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          color: Colors.green,
                          child: Image.asset(
                            travelItem.url,
                            // width: double.infinity, // 填满整个容器
                            width: MediaQuery.of(context).size.width, // 填满整个容器
                            fit: BoxFit.cover, // 直接裁切
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 45,
                        left: 15,
                        child: Column(
                          children: [
                            Material(
                              color: Colors.transparent,
                              child: Text(
                                travelItem.name,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                            Material(
                              color: Colors.transparent,
                              child: Text(
                                travelItem.location,
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey.shade400),
                              ),
                            )
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ))
                  ],
                ),
              );
            }),
        Positioned(
            bottom: -12,
            right: 60,
            child: InkWell(
              child: Container(
                height: 60,
                width: 60,
                child: Icon(
                  Icons.arrow_forward_outlined,
                  color: Colors.white,
                  size: 30,
                ),
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(30)),
              ),
              onTap: () {
                if (_pageCtrl.page! + 1 == _list.length) {
                  _pageCtrl.animateToPage(0,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease);
                } else {
                  _pageCtrl.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease);
                }
              },
            ))
      ],
    );
  }
}
