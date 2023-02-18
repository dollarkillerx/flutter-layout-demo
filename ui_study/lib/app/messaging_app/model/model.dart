import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mock_data/mock_data.dart';

class Friends {
  String name;
  String avatar;
  Color color;
  List<Message> messages;
  String lastTime;

  Friends(this.name, this.avatar, this.color, this.messages, this.lastTime);

  static List<Friends> generateFriends() {
    return [
      Friends(
          mockName(),
          "assets/images/user0.png",
          Colors.orange,
          Message.generateMessage(),
          DateFormat('yyyy-MM-dd – kk:mm').format(mockDate()))
    ];
  }
}

class Message {
  String text;
  String time;

  Message(this.text, this.time);

  static List<Message> generateMessage() {
    return [
      Message(mockString(6, 'aA'),
          DateFormat('yyyy-MM-dd – kk:mm').format(mockDate())),
      Message(mockString(5, 'aA'),
          DateFormat('yyyy-MM-dd – kk:mm').format(mockDate())),
      Message(mockString(10, 'aA'),
          DateFormat('yyyy-MM-dd – kk:mm').format(mockDate())),
      Message(mockString(16, 'aA'),
          DateFormat('yyyy-MM-dd – kk:mm').format(mockDate())),
      Message(mockString(13, 'aA'),
          DateFormat('yyyy-MM-dd – kk:mm').format(mockDate())),
      Message("Hey there! What's up?😋",
          DateFormat('yyyy-MM-dd – kk:mm').format(mockDate())),
      Message("It's hard to be productuve, man🥰",
          DateFormat('yyyy-MM-dd – kk:mm').format(mockDate())),
    ];
  }
}
