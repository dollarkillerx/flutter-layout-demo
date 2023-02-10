import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
          appBar: AppBar(title: Text("基础布局")),
          body: FlexPage(),
        ));
  }
}

class FlexPage extends StatelessWidget {
  const FlexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.cyan,
            ),
          ),
          const Spacer(),
          Expanded(
            child: FlutterLogo(
              size: 100,
            ),
            flex: 1,
          )
        ],
      ),
    );
  }
}
