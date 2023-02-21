import 'package:flutter/material.dart';
import 'package:ui_study/app/job_app/constants/colors.dart';
import 'package:ui_study/app/job_app/model/model.dart';

class MoreCard extends StatelessWidget {
  const MoreCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var jobs = Job.generateJobs();

    return Container(
      height: 230,
      width: double.infinity,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => buildCard(jobs.elementAt(index)),
          separatorBuilder: (context, index) => SizedBox(
                width: 5,
              ),
          itemCount: jobs.length),
    );
  }

  Container buildCard(Job job) {
    return Container(
      width: 360,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 60,
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
                            fontSize: 25, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  job.collect
                      ? Icon(
                          Icons.bookmark_border,
                          size: 35,
                          color: JobColors.primaryColor,
                        )
                      : Icon(
                          Icons.bookmark_border,
                          size: 35,
                          color: Colors.grey,
                        )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              job.jobName,
              maxLines: 2,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, overflow: TextOverflow.ellipsis),
            ),
            SizedBox(
              height: 10,
            ),
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
                    color: Colors.grey,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
