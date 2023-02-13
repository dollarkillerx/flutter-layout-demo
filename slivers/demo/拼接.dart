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

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text(widget.title),
//     ),
//     body: Center(
//       child: SizedBox(
//         height: 450,
//         width: 300,
//         child: ListView.builder(
//             itemBuilder: (context, index) {
//               return Container(
//                 height: 200,
//                 color: Colors.primaries[index % 18],
//               );
//             }),
//       ),
//     ),
//     floatingActionButton: FloatingActionButton(
//       onPressed: _incrementCounter,
//       tooltip: 'Increment',
//       child: const Icon(Icons.add),
//     ), // This trailing comma makes auto-formatting nicer for build methods.
//   );
// }
}
