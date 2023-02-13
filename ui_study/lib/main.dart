import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_study/common/routers/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Ui Study",
      initialRoute: AppPages.InitRoute, // 默认路由
      getPages: AppPages.routers, // 页面表
      unknownRoute: AppPages.unknownRoute, // 404路由

      // 基础配置
      debugShowCheckedModeBanner: false, // 不显示debug
    );
  }
}


