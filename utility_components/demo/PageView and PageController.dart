import "package:flutter/material.dart";

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
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = PageController(initialPage: 1);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page View"),
        actions: [
          InkWell(
            child: Icon(Icons.keyboard_arrow_left),
            onTap: () {
              // controller.animateToPage(
              //     controller.initialPage == 0 ? 0 : controller.initialPage - 1,
              //     duration: const Duration(seconds: 1),
              //     curve: Curves.easeInOut);
              controller.previousPage(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut);
            },
          ),
          InkWell(
            child: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              controller.nextPage(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut);
            },
          )
        ],
      ),
      body: PageView(
        controller: controller,
        scrollDirection: Axis.vertical, // 上下滑动
        children: [
          Container(
            color: Colors.red,
            child: const Center(
              child: Text('Page 1'),
            ),
          ),
          Container(
            color: Colors.indigo,
            child: const Center(
              child: Text('Page 2'),
            ),
          ),
          Container(
            color: Colors.green,
            child: const Center(
              child: Text('Page 3'),
            ),
          )
        ],
      ),
    );
  }
}
