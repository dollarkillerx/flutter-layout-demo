import 'package:flutter/material.dart';
import 'package:ui_study/app/travel_app/model/travel.dart';

class MostPopular extends StatelessWidget {
  final _list = Travel.generateMostBlog();

  MostPopular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8.0),
      itemBuilder: (context, index) {
        var travel = _list.elementAt(index);
        return Stack(
          children: [
            Container(
              width: 110,
              child: Image.asset(
                travel.url,
                fit: BoxFit.cover,
              ),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  color: Colors.cyan, borderRadius: BorderRadius.circular(10)),
            ),
            Positioned(
                bottom: 15,
                left: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      travel.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      travel.location,
                      style: TextStyle(
                        color: Colors.cyan,
                        fontSize: 10,
                      ),
                      maxLines: 1,
                      // softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ))
          ],
        );
      },

      scrollDirection: Axis.horizontal, // 水平方向滑动
      itemCount: _list.length,
      separatorBuilder: (BuildContext context, int index) { // 分割符
        return SizedBox(
          width: 15,
        );
      },
    );
    // return ListView.builder(
    //     itemBuilder: (context, index) {
    //       var travel = _list.elementAt(index);
    //       print(travel.url);
    //       return Stack(
    //         children: [
    //           Container(
    //             margin: EdgeInsets.all(10),
    //             width: 110,
    //             child: Image.asset(
    //               travel.url,
    //               fit: BoxFit.cover,
    //             ),
    //             clipBehavior: Clip.antiAlias,
    //             decoration: BoxDecoration(
    //                 color: Colors.cyan,
    //                 borderRadius: BorderRadius.circular(10)),
    //           ),
    //           Positioned(
    //               bottom: 15,
    //               left: 18,
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text(
    //                     travel.name,
    //                     style: TextStyle(
    //                       color: Colors.white,
    //                       fontSize: 15,
    //                       fontWeight: FontWeight.w400,
    //                     ),
    //                   ),
    //                   Text(
    //                     travel.location,
    //                     style: TextStyle(
    //                       color: Colors.cyan,
    //                       fontSize: 10,
    //                     ),
    //                     maxLines: 1,
    //                     // softWrap: true,
    //                     overflow: TextOverflow.ellipsis,
    //                   ),
    //                 ],
    //               ))
    //         ],
    //       );
    //     },
    //
    //     // separatorBuilder: separatorBuilder,
    //     scrollDirection: Axis.horizontal, // 水平方向滑动
    //     itemCount: _list.length);
  }
}
