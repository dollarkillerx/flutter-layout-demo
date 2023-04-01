import 'package:flutter/material.dart';
import 'package:wechat_book/widgets/card_recommend.dart';
import 'package:wechat_book/widgets/custom_appbar.dart';

class ContentPager extends StatefulWidget {
  PageController pageController;

  ContentPager({Key? key, required this.pageController}) : super(key: key);

  @override
  State<ContentPager> createState() => _ContentPagerState();
}

class _ContentPagerState extends State<ContentPager> {
  static List<Color> _colors = [
    Colors.blue,
    Colors.red,
    Colors.deepOrange,
    Colors.teal,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // appBar
        CustomAppBar(),

        // body
        Expanded(
            child: PageView(
          controller: widget.pageController,
          children: [
            _wrapItem(CardRecommend()),
            _wrapItem(CardRecommend()),
            _wrapItem(CardRecommend()),
            _wrapItem(CardRecommend()),
          ],
        ))
      ],
    );
  }

  Widget _wrapItem(Widget widget) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: widget,
    );
  }

  // Widget _wrapItem(int index) {
  //   return Padding(
  //     padding: EdgeInsets.all(10),
  //     child: Container(
  //       decoration: BoxDecoration(color: _colors[index]),
  //     ),
  //   );
  // }
}
