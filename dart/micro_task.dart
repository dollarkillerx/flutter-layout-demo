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