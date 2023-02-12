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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//实现WidgetsBindingObserver观察者
class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  bool _hidden = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this); //添加观察者
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text("App生命周期"),
          ),
          body: Column(
            children: <Widget>[
              const Text("首页"),
            ],
          ),
        ),
        if (_hidden)
          Container(
            color: Colors.amber.withOpacity(0.8), // withOpacity 透明
          )
      ],
    );
  }

  //  生命周期变化时回调
  //  resumed:应用可见并可响应用户操作,app进入前台
  //  inactive:用户可见，但不可响应用户操作，比如来了个电话,前后台切换的过渡状态
  //  paused:已经暂停了，用户不可见、不可操作，app进入后台
  //  suspending：应用被挂起，此状态IOS永远不会回调
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.resumed:
        _hidden = false;
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
        _hidden = true;
        break;
      case AppLifecycleState.detached:
      // TODO: Handle this case.
        break;
    }

    setState(() {
      _hidden;
    });

    print("didChangeAppLifecycleState: $state");
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this); //销毁观察者
    super.dispose();
  }
}
