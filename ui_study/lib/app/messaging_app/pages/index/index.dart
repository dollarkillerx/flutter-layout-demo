import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_study/app/messaging_app/constants/colors.dart';
import 'package:ui_study/app/messaging_app/model/model.dart';
import 'controller.dart';

class MessagingIndexPage extends GetView<MessagingIndexController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MessagingIndexController>(builder: (controller) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Row(
            children: [buildHeader(context)],
          ),
        ),
      );
    });
  }

  Container buildHeader(BuildContext context) {
    final List<Friends> friends = Friends.generateFriends();
    // final List<Friends> fir = [
    //   Friends("", avatar, Colors.grey.withOpacity(0.8), [], "")
    // ];

    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: MessagingColors.kPrimary,
      ),
      child: SafeArea(
        child: Column(
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
                    var i = index - 1;
                    if (index < 0) {
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
                        width: 10,
                      ),
                  itemCount: friends.length + 1),
            )
          ],
        ),
      ),
    );
  }
}

class NewAvatar extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;

  const NewAvatar({
    super.key,
    required this.child,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      child: CircleAvatar(
        child: child,
        backgroundColor: backgroundColor,
      ),
    );
  }
}
