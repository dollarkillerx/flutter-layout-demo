import 'dart:io';
import 'dart:isolate';

void main() {
  // test1();
  // test2();
  test3();
}

test1() async {
  // 使用 periodic 创建流， 第一个参数为间隔事件， 第二个参数为回掉函数
  Stream<String> stream =
      Stream<String>.periodic(Duration(seconds: 1), callback);
  // await for
  sleep(Duration(seconds: 3));
  await for (var i in stream) {
    print(i);
  }
}

String callback(int value) {
  print('send $value');
  return 'get send $value';
}

test2() async {
  print("test start");
  Future<String> fut = Future(() {
    return "async task";
  });

  // 从Future创建Stream
  Stream<String> stream = Stream<String>.fromFuture(fut);
  await for (var s in stream) {
    print(s);
  }
  print("test end");
}

test3() async {
  print("test start");

  ReceivePort rp = new ReceivePort();
  SendPort sp = rp.sendPort;
  Isolate.spawn((SendPort sp) {
    Stream<String> stream =
        Stream<String>.periodic(Duration(seconds: 1), callback);
    sp.send(stream);
  }, sp);

  rp.listen((message) async {
    if (message is Stream<String>) {
      await for (var s in message as Stream<String>) {
        print(s);
      }
      rp.close(); // 关闭监听
    }
  });

  print("test end");
}
