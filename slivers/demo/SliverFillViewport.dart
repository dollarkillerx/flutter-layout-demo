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
          SliverFillViewport(
            delegate: SliverChildListDelegate([
              FlutterLogo(
                size: 60,
              ),
              Text("Hello Sliver!"),
              FlutterLogo(
                size: 300,
              ),
              Text("Hello Sliver!")
            ]),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 3,
              color: Colors.black,
              margin: EdgeInsets.symmetric(vertical: 5),
            ),
          ),
        ],
      ),
    );
  }
}
