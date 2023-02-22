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
