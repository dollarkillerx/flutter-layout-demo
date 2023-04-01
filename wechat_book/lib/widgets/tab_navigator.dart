import 'package:flutter/material.dart';
import 'package:wechat_book/constants/colors.dart';
import 'package:wechat_book/widgets/content_pager.dart';

class TabNavigator extends StatefulWidget {
  const TabNavigator({Key? key}) : super(key: key);

  @override
  State<TabNavigator> createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  int _currentIndex = 0; // 选中 index
  final PageController controller = PageController(
    initialPage: 0, // 初始页面
    viewportFraction: 0.8, // 视窗比例
  );

  @override
  Widget build(BuildContext context) {
    controller.addListener(() {
      setState(() {
        _currentIndex = controller.page!.round();
      });
    });

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            // 渐变
            colors: [
              Color(0xffedeef0),
              Color(0xffe6e7e9),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ContentPager(
          pageController: controller,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          _bottomItems("本周", Icons.folder, 0),
          _bottomItems("分享", Icons.explore, 1),
          _bottomItems("免费", Icons.sms, 2),
          _bottomItems("长安", Icons.person, 3),
        ],
        type: BottomNavigationBarType.fixed,
        // fixed 固定宽度
        currentIndex: _currentIndex,
        onTap: (idx) {
          setState(() {
            _currentIndex = idx;
          });
          controller.animateToPage(idx,
              duration: Duration(milliseconds: 500), curve: Curves.ease);
        },
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: WechatBookColors.activeColor,
        unselectedItemColor: WechatBookColors.defaultColor,
        selectedFontSize: 15,
        unselectedFontSize: 10,
      ),
    );
  }

  // bottom item button
  BottomNavigationBarItem _bottomItems(String title, IconData icon, int index) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: WechatBookColors.defaultColor,
      ),
      activeIcon: Icon(
        icon,
        color: WechatBookColors.activeColor,
      ),
      label: title,
      // backgroundColor: Colors.black26,
    );
  }
}
