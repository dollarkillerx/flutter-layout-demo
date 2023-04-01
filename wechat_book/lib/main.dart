import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wechat_book/widgets/tab_navigator.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark); // 沉浸式bar
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wechat Book',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: TabNavigator(),
    );
  }

}