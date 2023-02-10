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

        debugShowCheckedModeBanner: false, // 关闭debug
        // debugShowMaterialGrid: true, // debug参考线

        home: Scaffold(
          appBar: AppBar(
              title: Text("基础布局")
          ),
          body: Container(
            width: double.infinity, // 无限宽度
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FlutterLogo(size: 100,),
                FlutterLogo(size: 150,),
                FlutterLogo(size: 200,),
              ],
            ),
          ),
        ));
  }
}


