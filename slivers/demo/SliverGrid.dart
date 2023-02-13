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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                FlutterLogo(
                  size: 60,
                ),
                Text("Hello Sliver!")
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 3,
              color: Colors.black,
              margin: EdgeInsets.symmetric(vertical: 5),
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return Container(
                  height: 200,
                  color: Colors.primaries[index % Colors.primaries.length],
                );
              },
              childCount: 180,
            ),
            // 控制每行显示个数
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 3,
              color: Colors.black,
              margin: EdgeInsets.symmetric(vertical: 5),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return Container(
                    height: 200,
                    color: Colors.primaries[index % 18],
                  );
                },
                childCount: 18,
              )),
        ],
      ),
    );
  }
}
