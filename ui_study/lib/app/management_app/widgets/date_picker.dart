import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  final weekList = ["Sun", 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

  final dayList = ['24', '25', '26', '27', '28', '29', '30'];
  var selected = 4;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selected = index;
                });
              },
              child: Container(
                height: 100,
                width: 50,
                decoration: index == selected
                    ? BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20))
                    : BoxDecoration(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      weekList.elementAt(index),
                      style: TextStyle(
                        color:
                            index == selected ? Colors.black87 : Colors.black26,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      dayList.elementAt(index),
                      style: TextStyle(
                        color:
                            index == selected ? Colors.black87 : Colors.black26,
                        fontWeight: index == selected
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(
                width: 10,
              ),
          itemCount: dayList.length),
    );
  }
}
