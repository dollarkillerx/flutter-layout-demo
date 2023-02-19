import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_study/app/messaging_app/constants/colors.dart';
import '../../widgets/msg_card.dart';
import 'controller.dart';

class MessagingDetailPage extends GetView<MessagingDetailController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MessagingDetailController>(builder: (controller) {
      return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   leading: Container(
        //       padding: EdgeInsets.only(left: 20),
        //       child: Text(
        //         "Back",
        //         style: TextStyle(color: Colors.grey),
        //       )),
        //   actions: [
        //     Container(
        //         padding: EdgeInsets.only(right: 20),
        //         child: Text("Search", style: TextStyle(color: Colors.grey)))
        //   ],
        // ),
        backgroundColor: MessagingColors.kPrimary,
        body: Container(
          child: Column(
            children: [
              Expanded(child: buildHeader(controller)),
              Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        )),
                    child: Stack(
                      children: [
                        Container(
                          child: ListView.separated(
                              itemBuilder: (context, index) {
                                if (index % 2 == 0) {
                                  return MsgCard(
                                    message: controller.friend.messages
                                        .elementAt(index),
                                    friend: controller.friend,
                                  );
                                } else {
                                  return MsgCard(
                                    message: controller.friend.messages
                                        .elementAt(index),
                                  );
                                }
                              },
                              separatorBuilder: (controller, index) => SizedBox(
                                    height: 10,
                                  ),
                              itemCount: controller.friend.messages.length),
                          margin: EdgeInsets.only(bottom: 60),
                        ),
                        Align(
                          // 固定定位
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 60,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                                color: Color(0xfff7f7f8),
                                borderRadius: BorderRadius.circular(50)),
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Type your message...',
                                suffixIcon: Container(
                                  height: 10,
                                  width: 10,
                                  child: Icon(
                                    Icons.send,
                                    color: Colors.white,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.deepPurpleAccent,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),
      );
    });
  }

  Widget buildHeader(MessagingDetailController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SafeArea(
            child: Container(
              // padding: EdgeInsets.symmetric(horizontal: 20),
              // color: Colors.green,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Back",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      Text("Search",
                          style: TextStyle(color: Colors.grey, fontSize: 16))
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                controller.friend.name,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    child: Icon(
                      Icons.call,
                      size: 30,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    child: Icon(
                      Icons.video_camera_back,
                      size: 30,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
