import 'package:flutter/material.dart';

import '../model/model.dart';
import 'new_avatar.dart';

class FriendsCard extends StatelessWidget {
  final Friend friend;

  const FriendsCard({
    super.key,
    required this.friend,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          NewAvatar(
              child: Image.asset(friend.avatar), backgroundColor: friend.color),
          SizedBox(
            width: 20,
          ),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          friend.name,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          friend.messages[friend.messages.length - 1].time,
                          style: TextStyle(color: Colors.black26),
                        ),
                      ],
                    ),
                    // padding: EdgeInsets.only(right: 50),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    friend.messages[friend.messages.length - 1].text,
                    style: TextStyle(fontSize: 16, overflow: TextOverflow.ellipsis),
                    maxLines: 1,
                  )
                ],
              ))
        ],
      ),
    );
  }
}
