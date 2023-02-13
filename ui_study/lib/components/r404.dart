import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class R404 extends StatelessWidget {
  const R404({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BrnAbnormalStateWidget(
      img: Image.asset(
        'assets/images/content_failed.png',
        scale: 3.0,
      ),
      isCenterVertical: true,
      title: "404 路由没有找到",
      operateTexts: <String>["点击返回"],
      operateAreaType: OperateAreaType.textButton,
      action: (index) {
        Get.back();
        // BrnToast.show("获取数据失败，请重试", context);
      },
    );
  }
}
