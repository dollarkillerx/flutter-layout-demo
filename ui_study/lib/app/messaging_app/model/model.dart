import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mock_data/mock_data.dart';

class Friend {
  String name;
  String avatar;
  Color color;
  List<Message> messages;
  String lastTime;

  Friend(this.name, this.avatar, this.color, this.messages, this.lastTime);

  static List<Friend> generateFriends() {
    return [
      Friend(mockName(), "assets/images/user0.png", Colors.orange,
          Message.generateMessage(), DateFormat('kk:mm').format(mockDate())),
      Friend(mockName(), "assets/images/user1.png", Colors.greenAccent,
          Message.generateMessage(), DateFormat('kk:mm').format(mockDate())),
      Friend(mockName(), "assets/images/user2.png", Colors.amberAccent,
          Message.generateMessage(), DateFormat('kk:mm').format(mockDate())),
      Friend(mockName(), "assets/images/user3.png", Colors.black26,
          Message.generateMessage(), DateFormat('kk:mm').format(mockDate())),
      Friend(mockName(), "assets/images/user4.png", Colors.cyan,
          Message.generateMessage(), DateFormat('kk:mm').format(mockDate())),
      Friend(mockName(), "assets/images/user5.png", Colors.yellowAccent,
          Message.generateMessage(), DateFormat('kk:mm').format(mockDate())),
      Friend(mockName(), "assets/images/user6.png", Colors.deepPurpleAccent,
          Message.generateMessage(), DateFormat('kk:mm').format(mockDate())),
    ];
  }
}

class Message {
  String text;
  String time;

  Message(this.text, this.time);

  static List<Message> generateMessage() {
    return [
      Message(mockString(100, 'aA'), DateFormat('kk:mm').format(mockDate())),
      Message(mockString(20, 'aA'), DateFormat('kk:mm').format(mockDate())),
      Message(mockString(10, 'aA'), DateFormat('kk:mm').format(mockDate())),
      Message(mockString(16, 'aA'), DateFormat('kk:mm').format(mockDate())),
      Message(mockString(20, 'aA'), DateFormat('kk:mm').format(mockDate())),
      Message(mockString(10, 'aA'), DateFormat('kk:mm').format(mockDate())),
      Message(mockString(16, 'aA'), DateFormat('kk:mm').format(mockDate())),
      Message(mockString(20, 'aA'), DateFormat('kk:mm').format(mockDate())),
      Message(mockString(10, 'aA'), DateFormat('kk:mm').format(mockDate())),
      Message(mockString(16, 'aA'), DateFormat('kk:mm').format(mockDate())),
      Message(mockString(13, 'aA'), DateFormat('kk:mm').format(mockDate())),
      Message(
          "Hey there! What's up?😋", DateFormat('kk:mm').format(mockDate())),
      Message("It's hard to be productuve, man🥰",
          DateFormat('kk:mm').format(mockDate())),
    ];
  }
}
