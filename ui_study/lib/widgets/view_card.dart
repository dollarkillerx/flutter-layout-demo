import 'package:flutter/material.dart';

class ViewCard extends StatelessWidget {
  final String img;
  final String title;
  final String description;
  final GestureTapCallback onTap;

  const ViewCard({
    super.key,
    required this.img,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.all(20),
        child: Stack(
          children: [
            Image.asset(img),
            Positioned(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  SizedBox(height: 6,),
                  Text(
                    description,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.red),
                  )
                ],
              ),
              bottom: 30,
              left: 30,
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onTap: onTap,
    );
  }
}
