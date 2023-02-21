import 'package:flutter/material.dart';
import 'package:ui_study/app/job_app/model/model.dart';

import '../constants/colors.dart';

const defaultTextStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.normal,
  color: Colors.black,
  // overflow: TextOverflow.ellipsis,
  decoration: TextDecoration.none,
);

class JobDetail extends StatelessWidget {
  final Job job;

  const JobDetail({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(40), topLeft: Radius.circular(40))),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(bottom: 80), // 让出按钮空间
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildHeader(),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      job.jobName,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    buildLCart(),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Requirement",
                      style: defaultTextStyle.merge(TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                      )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ...job.requirement
                        .map((e) => Container(
                              margin: EdgeInsets.only(bottom: 20),
                              child: Text(
                                '* $e',
                                maxLines: 10,
                                style: defaultTextStyle,
                              ),
                            ))
                        .toList(),
                  ],
                ),
              ),
            ),
            Align(
              // 浮动按钮
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {},
                child: Container(
                  height: 70,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    "Apply Now",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: JobColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildLCart() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              color: JobColors.accentColor,
              size: 30,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              job.location,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
                overflow: TextOverflow.ellipsis,
                decoration: TextDecoration.none,
              ),
            )
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.timer_outlined,
              color: JobColors.accentColor,
              size: 30,
            ),
            SizedBox(
              width: 3,
            ),
            Text(
              "Full Time",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
                overflow: TextOverflow.ellipsis,
                decoration: TextDecoration.none,
              ),
            )
          ],
        )
      ],
    );
  }

  Row buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 60,
              padding: EdgeInsets.all(5),
              child: Image.asset(job.icon),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(15)),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              job.companyName,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.normal,
                color: Colors.black,
                decoration: TextDecoration.none,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.bookmark_border,
              size: 30,
              color: job.collect ? JobColors.primaryColor : Colors.black,
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.more_horiz,
              size: 30,
            ),
          ],
        ),
      ],
    );
  }
}
