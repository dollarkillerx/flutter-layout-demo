import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:ui_study/app/management_app/model/model.dart';

class ManagementTasksCard extends StatelessWidget {
  const ManagementTasksCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var tasks = Task.generateTasks();

    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tasls",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Container(
              child: GridView.builder(
                // shrinkWrap: true,
                itemCount: tasks.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 每行两个
                  crossAxisSpacing: 10, // 行间隔
                  mainAxisSpacing: 10, // 纵间隔
                ),
                itemBuilder: (context, index) {
                  return buildCard(tasks.elementAt(index));
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildCard(Task task) {
    if (task.isLast! == false) {
      return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              task.iconData,
              color: task.iconColor,
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              task.title!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Text("${task.left} left"),
                  height: 30,
                  width: 70,
                  decoration: BoxDecoration(
                      color: task.btnColor,
                      borderRadius: BorderRadius.circular(30)),
                ),
                // SizedBox(
                //   width: 1,
                // ),
                Container(
                  alignment: Alignment.center,
                  child: Text("${task.done} done"),
                  height: 30,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                )
              ],
            )
          ],
        ),
        decoration: BoxDecoration(
            color: task.bgColor, borderRadius: BorderRadius.circular(25)),
      );
    }

    return Container(
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: Radius.circular(20),
        dashPattern: [10, 10],
        // 线条宽松
        color: Colors.grey,
        child: Center(
          child: Text(" + Add", style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),),
        ),
      ),
      // decoration: BoxDecoration(
      //     color: task.bgColor, borderRadius: BorderRadius.circular(25)
      // ),
    );
  }
}
