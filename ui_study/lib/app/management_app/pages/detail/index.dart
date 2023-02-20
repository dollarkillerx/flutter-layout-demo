import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_study/app/management_app/widgets/date_picker.dart';
import 'package:ui_study/app/management_app/widgets/task_timeline.dart';
import 'controller.dart';

class ManagementDetailPage extends GetView<ManagementDetailController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ManagementDetailController>(builder: (controller) {
      // return Scaffold(
      //   backgroundColor: Colors.black54,
      //   body: Column(
      //     children: [
      //       buildHeader(),
      //       Expanded(
      //           child: Container(
      //         decoration: BoxDecoration(
      //             color: Colors.white,
      //             borderRadius: BorderRadius.only(
      //                 topLeft: Radius.circular(20),
      //                 topRight: Radius.circular(20))),
      //             child: Column(
      //               children: [
      //
      //               ],
      //             ),
      //       ))
      //     ],
      //   ),
      // );

      return Scaffold(
        backgroundColor: Colors.black,
        body: CustomScrollView(
          slivers: [
            buildAppar(context),
            SliverToBoxAdapter(
              child: DatePicker(),
            ),
            buildSliverTitle(),
            controller.task.desc == null
                ? SliverFillRemaining(
                    // 撑满 sliver
                    child: Container(
                      color: Colors.white,
                      child: Center(
                        child: Text(
                          "Not task today",
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    ),
                  )
                : SliverList( // ListView.build = SliverChildBuilderDelegate
                    delegate: SliverChildBuilderDelegate(
                        childCount: controller.task.desc!.length,
                        (_, index) => TaskTimeline(
                            detial: controller.task.desc!.elementAt(index))))
          ],
        ),
      );
    });
  }

  SliverToBoxAdapter buildSliverTitle() {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tasks",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Text("Timeline"),
                        Icon(Icons.arrow_circle_down)
                      ],
                    ),
                    height: 40,
                    width: 90,
                    padding: EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildAppar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 90,
      backgroundColor: Colors.black,
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(Icons.arrow_back_ios),
        iconSize: 20,
      ),
      actions: [
        Icon(
          Icons.more_vert_outlined,
          color: Colors.white,
        )
      ],
      // title: Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Text(
      //       "Personal tasks",
      //       style: TextStyle(
      //         color: Colors.white,
      //         fontSize: 27,
      //         fontWeight: FontWeight.bold,
      //       ),
      //     ),
      //     SizedBox(
      //       height: 10,
      //     ),
      //     Text(
      //       "You have 3 new tasks for today!",
      //       style: TextStyle(
      //         color: Colors.white.withOpacity(0.8),
      //         fontSize: 15,
      //         fontWeight: FontWeight.w400,
      //       ),
      //     )
      //   ],
      // ),
      flexibleSpace: FlexibleSpaceBar(
        // 带有动态效果的bar
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end, // 必要
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Personal tasks",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "You have 3 new tasks for today!",
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }

  // slivers
  SafeArea buildHeader() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.keyboard_arrow_left,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Personal tasks",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "You have 3 new tasks for today!",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                )
              ],
            ),
            Icon(
              Icons.more_vert_outlined,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
