import 'package:flutter/material.dart';
import 'package:ui_study/app/food_app/constants/colors.dart';
import 'package:ui_study/app/food_app/model/model.dart';

class ListButton extends StatefulWidget {
  const ListButton({Key? key}) : super(key: key);

  @override
  State<ListButton> createState() => _ListButtonState();
}

class _ListButtonState extends State<ListButton> {
  var actionIdx = 0;
  var tags = FoodModel.generateTags();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30, top: 5, bottom: 5),
      height: 60,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    actionIdx = index;
                  });
                },
                child: Container(
                  child: Text(
                    tags.elementAt(index),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  decoration: BoxDecoration(
                      color: actionIdx == index
                          ? FoodColors.accentColor
                          : Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
          separatorBuilder: (context, index) => Container(
                width: 15,
              ),
          itemCount: tags.length),
    );
  }
}
