import 'package:flutter/material.dart';

class HuListCard extends StatelessWidget {
  const HuListCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Top of the week",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "View all",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
