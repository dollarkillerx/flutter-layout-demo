import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_study/app/messaging_app/constants/colors.dart';
import 'package:ui_study/app/messaging_app/model/model.dart';
import '../../../../common/routers/app_routes.dart';
import '../../widgets/friends_card.dart';
import '../../widgets/new_avatar.dart';
import 'controller.dart';

class MessagingIndexPage extends GetView<MessagingIndexController> {
  final List<Friend> friends = Friend.generateFriends();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MessagingIndexController>(builder: (controller) {
      return Scaffold(
        body: Container(
          child: Column(
            children: [buildHeader(context), buildBody()],
          ),
        ),
      );
    });
  }

  Widget buildBody() => Expanded(
        child: Container(
          // color: Colors.cyan,
          color: Colors.white,
          // child: Column(
          //   children: [...friends.map((e) => FriendsCard(friend: e))],
          // ),
          child: ListView.separated(
            padding: EdgeInsets.zero,
            // itemBuilder: (context, index) => Container(
            //   height: 100,
            //   color: Colors.yellow,
            // ),
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Get.toNamed(
                    AppRoutes.pathJoin([AppRoutes.Messaging, AppRoutes.Detail]),
                    arguments: {
                      "friend": friends.elementAt(index),
                    });
              },
              child: FriendsCard(
                friend: friends.elementAt(index),
              ),
            ),
            separatorBuilder: (context, index) => SizedBox(
              height: 1,
            ),
            itemCount: friends.length,
          ),
        ),
      );

  Container buildHeader(BuildContext context) {
    // final List<Friend> friends = Friend.generateFriends();

    return Container(
      height: 270,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: MessagingColors.kPrimary,
      ),
      child: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    "Chat with\nyour friends",
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        index -= 1;
                        if (index == -1) {
                          return Container(
                            child: NewAvatar(
                              child: Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 40,
                              ),
                              backgroundColor: Colors.grey.withOpacity(0.8),
                            ),
                          );
                        }
                        return Container(
                          child: NewAvatar(
                            child: Image.asset(friends.elementAt(index).avatar),
                            backgroundColor: friends.elementAt(index).color,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                            width: 5,
                          ),
                      itemCount: friends.length + 1),
                )
              ],
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
