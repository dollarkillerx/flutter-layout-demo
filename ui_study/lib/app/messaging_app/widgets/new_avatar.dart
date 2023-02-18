import 'package:flutter/material.dart';

class NewAvatar extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;

  const NewAvatar({
    super.key,
    required this.child,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      child: CircleAvatar(
        child: child,
        backgroundColor: backgroundColor,
      ),
    );
  }
}
