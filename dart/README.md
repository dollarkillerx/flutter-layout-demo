# Dart 进步
- 异步编程
- Stream
- 文件

### 异步

dart的异步基于两个队列实现 分别为

- MicroTask 微任务队列 
- Event 事件队列

dart 执行事会先（消费完） MicroTask 队列中的任务 再消费 Event 队列中的任务

注意 MicroTask 任务过多 会阻塞程序执行

##### MicroTask

添加任务

``` 
import 'dart:async';

void myTask() {
  print('this is my task');
}

void main() {
  // 1. 使用 scheduleMicrotask 添加
  scheduleMicrotask(myTask);

  // 2. 使用 Future 对象添加
  new Future.microtask(myTask);

  for (var i=0;i<20;i++) {
    print('object $i');
  }
}
```

##### Event

添加任务

``` 
import  'dart:async';

void  main() {
  print("main start"); // print 1

  new  Future((){
    print("this is my task"); // 会后执行 print 4
  });

  new  Future.microtask((){
    print("this is microtask"); // print 3
  });

  print("main stop"); // print 2
}
```

运行结果：

``` 
main start
main stop
this is microtask
this is my task
```

#### 延时任务

``` 
import 'dart:async';
import 'dart:io';

void main() {
  print("main start");

  new Future.delayed(new Duration(seconds: 1), () {  // 等待1s后再 加入 Event 队列
    print('task delayed');
  });

  new Future(() {
    // 模拟耗时5秒
    sleep(Duration(seconds: 5));
    print("5s task");
  });

  print("main stop");
}
```

output: 

``` 
main start
main stop
5s task
task delayed
```

#### 创建 Future

- Future()   // 创建 Event 队列
- Future.microtask() // 创建 microtask 队列
- Future.sync() // 立即执行
- Future.value()
- Future.delayed()
- Future.error()

``` 
import 'dart:async';
import 'dart:io';

void main() {
  print("main start");

  new Future(() {
    print("this is my task");
  });

  new Future.sync(() {
    sleep(Duration(seconds: 2));
    print("this is my task");
  });

  new Future.microtask(() {
    print("this is microtask");
  });

  print("main stop");
}
```

output: 

``` 
main start
this is my task
main stop
this is microtask
this is my task
```


##### async await

``` 
import 'dart:io';

doTask() async {
  print("do task start");
  sleep(Duration(seconds: 2));
  return "Ok";
}

test() async {
  var r = await doTask();
  print(r);
}

void main() {
  print("main start");
  test();
  print("main end");
}
```

output: 

``` 
main start
do task start
main end
Ok
```

> 需要注意，async 不是并行执行，它是遵循Dart 事件循环规则来执行的，它仅仅是一个语法糖，简化Future API的使用。

#### Isolate 多线程

- spawnUri 
- spawn (推荐)
- flutter Isolate

spawn 

```
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

  print("jc");

  SendPort? port2;
  receivePort.listen((message) {
    print("main isolate message: $message");

    if (message[1] is SendPort) {
      port2 = message[1];
    }

    port2?.send([1, "这条信息是 main isolate 发送的"]);
  });
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
```

flutter Isolate

``` 
import 'package:flutter/foundation.dart';
import  'dart:io';

// 创建一个新的Isolate，在其中运行任务doWork
create_new_task() async{
  var str = "New Task";
  var result = await compute(doWork, str);
  print(result);
}


void doWork(String value){
  print("new isolate doWork start");
  // 模拟耗时5秒
  sleep(Duration(seconds:5));

  print("new isolate doWork end");
  return "complete:$value";
}
```

> compute 函数有两个必须的参数，第一个是待执行的函数，这个函数必须是一个顶级函数，不能是类的实例方法，
> 可以是类的静态方法，第二个参数为动态的消息类型，可以是被运行函数的参数。需要注意，
> 使用compute 应导入'package:flutter/foundation.dart'包。

### Stream

