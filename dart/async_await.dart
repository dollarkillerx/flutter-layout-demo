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