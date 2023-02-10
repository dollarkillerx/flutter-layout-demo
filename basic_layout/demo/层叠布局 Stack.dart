import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter 布局基础',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(title: Text("Stack布局")),
          body: StackPage(),
        ));
  }
}

class StackPage extends StatelessWidget {
  const StackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none, // 绝对定位超出部分是否裁切
      children: [
        Container(
          color: Colors.amber,
          width: 300,
          height: 300,
        ),
        Container(
          color: Colors.blue.shade50,
          width: 200,
          height: 200,
        ),
        Container(
          color: Colors.green,
          width: 100,
          height: 100,
        ),

        // 绝对定位
        Positioned(
            left: 230,
            top: 10,
            child: FlutterLogo(
              size: 120,
            ))
      ],
    );
  }
}
