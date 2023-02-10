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
          appBar: AppBar(title: Text("基础布局")),
          body: ContainerPage(),
        ));
  }
}

class ContainerPage extends StatelessWidget {
  const ContainerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Container(
              // color: Colors.amber,
              width: 300,
              height: 200,
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Text("Container"),
              alignment: Alignment.center,

              // 容器的修饰
              decoration: BoxDecoration(
                color: Colors.amber,
                border: Border.all(color: Colors.blue, width: 5),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black, offset: Offset(0, 0), blurRadius: 2),
                  BoxShadow(
                      color: Colors.red, offset: Offset(3, 3), blurRadius: 2),
                ],

                // 背景img
                image: const DecorationImage(
                    image: NetworkImage("https://via.placeholder.com/600/92c952"), fit: BoxFit.cover),
              ),

              // 前景装饰
              foregroundDecoration: BoxDecoration(
                color: Colors.red.withOpacity(0.3), // 透明度
              ),

              // 转换
              transform: Matrix4.rotationZ(0.3), // 转换

              // 约束
              constraints: const BoxConstraints(
                minHeight: 100,
                maxHeight: 500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
