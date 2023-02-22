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

