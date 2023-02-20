import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TaskTimeline extends StatelessWidget {
  final Map<String, dynamic> detial;

  const TaskTimeline({Key? key, required this.detial}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Expanded(
              child: Container(
            height: 80,
            width: 30,
            child: Stack(
              children: [
                TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0,
                  isFirst: true,
                  afterLineStyle: LineStyle(
                    thickness: 2,
                    color: detial['tlColor'],
                  ),
                  indicatorStyle: IndicatorStyle(
                      indicatorXY: 0,
                      width: 15,
                      indicator: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border:
                                Border.all(width: 5, color: detial['tlColor'])),
                      )),
                ),
                Positioned(
                    left: 25,
                    child: Text(
                      detial['time'],
                    ))
              ],
            ),
          )),
          detial['bgColor'] != null
              ? Expanded(
                  flex: 3,
                  child: Container(
                    height: 65,
                    width: double.infinity,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: detial['bgColor'],
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          detial["title"],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          detial["slot"],
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ))
              : SizedBox()
        ],
      ),
    );
  }
}
