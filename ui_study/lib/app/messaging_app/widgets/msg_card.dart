import 'package:flutter/material.dart';

import '../model/model.dart';
import 'new_avatar.dart';

class MsgCard extends StatelessWidget {
  final Friend? friend;
  final Message message;

  const MsgCard({
    super.key,
    this.friend,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    if (friend != null) {
      return accept();
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          message.time,
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(20),
          width: 250,
          child: Text(message.text),
          decoration: BoxDecoration(
              color: Color(0xffedeef7),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(100),
                topLeft: Radius.circular(100),
                bottomLeft: Radius.circular(100),
              )),
        ),
      ],
    );
  }

  Row accept() {
    return Row(
      children: [
        Row(
          children: [
            NewAvatar(
                child: Image.asset(friend!.avatar),
                backgroundColor: friend!.color),
            SizedBox(
              width: 10,
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(20),
              width: 250,
              child: Text(message.text),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                    topLeft: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  )),
            ),
          ],
        ),
        Text(
          message.time,
          style: TextStyle(
            color: Colors.grey,
          ),
        )
      ],
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    );
  }
}
