import 'dart:math';

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
          appBar: AppBar(title: Text("对齐定位 Align")),
          body: AlignPage(),
        ));
  }
}

class AlignPage extends StatelessWidget {
  const AlignPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Align(
    //   heightFactor: 1.6,   // 定位   （微调）
    //   widthFactor: 1.2,
    //   // alignment: Alignment.topLeft,
    //   child: card(),
    // );
    return Align(
      alignment: FractionalOffset(0,0.02), // 指示标 为 左上角
      child: card(),
    );
  }
}

Widget card() {
  List<MaterialColor> colors = [
    Colors.green,
    Colors.blue,
    Colors.amber,
    Colors.red,
    Colors.grey,
    Colors.yellow,
    Colors.deepPurple,
    Colors.blueGrey,
  ];

  var rng = Random();

  return Container(
    color: colors[rng.nextInt(colors.length)],
    child: Text("Card ${rng.nextInt(1000)}"),
    alignment: Alignment.center,
    width: 100,
    height: 100,
  );
}