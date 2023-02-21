import 'package:flutter/material.dart';
import 'package:ui_study/app/job_app/constants/colors.dart';

class LeftList extends StatefulWidget {
  const LeftList({Key? key}) : super(key: key);

  @override
  State<LeftList> createState() => _LeftListState();
}

class _LeftListState extends State<LeftList> {
  var selecd = 0;

  @override
  Widget build(BuildContext context) {
    // List<Map<String, dynamic>> dataList = [
    //     {
    //       "key": "All",
    //     },
    //   {
    //     "key": "Popular",
    //     "icon":
    //   }
    // ];
    var dataList = [
      "All",
      "🔥 Popular",
      "⭐ Featured",
      "🔥 Popular",
      "⭐ Featured"
    ];

    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    selecd = index;
                    print(selecd);
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 26),
                  alignment: Alignment.center,
                  child: Text(
                    dataList.elementAt(index),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  decoration: selecd == index
                      ? BoxDecoration(
                          color: JobColors.primaryColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20))
                      : BoxDecoration(
                          border: Border.all(color: JobColors.primaryColor),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                ),
              ),
          separatorBuilder: (context, index) => SizedBox(
                width: 10,
              ),
          itemCount: dataList.length),
    );
  }
}
