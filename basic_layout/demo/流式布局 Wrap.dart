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
          appBar: AppBar(title: Text("Wrap布局")),
          body: WrapPage(),
        ));
  }
}

class WrapPage extends StatelessWidget {
  const WrapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Wrap(
        alignment: WrapAlignment.spaceBetween, // 对其方式
        spacing: 3, // 间距 水平
        runSpacing: 3, // 垂直
        children: [
          card(),
          card(),
          card(),
          card(),
          card(),
          card(),
          card(),
          card(),
          card(),
          card(),
          card(),
          card(),
          card(),
          card(),
          card(),
          card(),
        ],
      ),
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
    child: Text("Card"),
    alignment: Alignment.center,
    width: 100,
    height: 100,
  );
}