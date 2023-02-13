import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';

class TravelDetialPage extends GetView<TravelDetialController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TravelDetialController>(builder: (controller) {
      return Scaffold(
        appBar: TravelDetialAppBar(),
        body: Stack(
          children: [
            // CustomScrollView(
            //   slivers: [
            //     SliverPersistentHeader(delegate: delegate)
            //   ],
            // )
          ],
        ),
      );
    });
  }
}

class TravelDetialAppBar extends StatelessWidget with PreferredSizeWidget {
  const TravelDetialAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          Icons.keyboard_arrow_left,
          color: Colors.white,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.menu,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
