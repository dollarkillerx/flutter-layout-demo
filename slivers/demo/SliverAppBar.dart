import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // title: Text("Sliver App Bar"),

            // pinned: true, // 固定显示

            floating: true, // 稍微回滚 显示AppBar 默认为false需要滑动到最上面才显示
            snap: true, // 配合 floating

            // flexibleSpace 往下扩张 (美丽)
            expandedHeight: 300,
            stretch: true, // 拉伸
            flexibleSpace: FlexibleSpaceBar(
              background: FlutterLogo(),
              title: Text("Flexible Space Bar Title"),
              collapseMode: CollapseMode.parallax, // 上滑效果
              stretchModes: [ // 拉伸效果
                StretchMode.blurBackground, // 模糊背景
                StretchMode.zoomBackground, // 放大
                StretchMode.fadeTitle, // 消失title
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Placeholder(),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
                FlutterLogo(
                  size: 200,
                ),
                FlutterLogo(
                  size: 200,
                ),
                FlutterLogo(
                  size: 200,
                ),
                FlutterLogo(
                  size: 200,
                ),
                FlutterLogo()
              ]))
        ],
      ),
    );
  }
}
