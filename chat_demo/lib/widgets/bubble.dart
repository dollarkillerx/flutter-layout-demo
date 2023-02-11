import 'package:flutter/material.dart';

class BubbleWidget extends StatelessWidget {
  final String avatar;
  final String text;
  final TextDirection direction; // 文字方向  自己他人

  const BubbleWidget(
      {Key? key,
        required this.avatar,
        required this.text,
        this.direction = TextDirection.ltr})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
    child: Row(
      textDirection: direction,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(avatar),
          radius: 24,
          child: const SizedBox(
            width: 48,
            height: 48,
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Flexible(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.grey[200], borderRadius: BorderRadius.circular(32)),
              child: SelectableText(text),
            ))
      ],
    ),);
  }
}