import 'dart:io';
import 'dart:isolate';

void main() {
  print("main isolate start");
  crate_isolate();
  print("main isolate end");
}

crate_isolate() async {
  // 两个Isolate是通过两对Port对象通信
  // 一对Port分别由用于接收消息的ReceivePort对象
  // 和用于发送消息的SendPort对象构成。
  ReceivePort receivePort = new ReceivePort(); // 接收端口
  SendPort sendPort1 = receivePort.sendPort; // 发送端口

  Isolate newIsolate = await Isolate.spawn(doWork, sendPort1);

  print("start");

  SendPort? port2;
  receivePort.listen((message) {
    print("main isolate message: $message");

    if (message[1] is SendPort) {
      port2 = message[1];
    }

    port2?.send([1, "这条信息是 main isolate 发送的"]);
  });

  print("end");
}

// 耗时任务
void doWork(SendPort port1) {
  print("new isolate start");
  ReceivePort rp2 = new ReceivePort();
  SendPort port2 = rp2.sendPort;

  rp2.listen((message) {
    print("doWork message: $message");
  });

  // 将新isolate中创建的SendPort发送到主isolate中用于通信
  port1.send([0, port2]);
  // 模拟耗时5秒
  sleep(Duration(seconds: 5));
  port1.send([1, "doWork 任务完成"]);

  print("new isolate end");
}
