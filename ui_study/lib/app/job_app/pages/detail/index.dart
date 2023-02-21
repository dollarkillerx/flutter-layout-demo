import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ui_study/app/job_app/constants/colors.dart';
import '../../model/model.dart';
import 'controller.dart';

class JobDetailPage extends GetView<JobDetailController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<JobDetailController>(builder: (controller) {
      return Scaffold(
        body: Stack(
          children: [
            buildBg(),
            SafeArea(
                child: Column(
              children: [
                buildHeader(),
                buildSearch(),
                buildRList(controller),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) =>
                            buildCard(controller.jobs.elementAt(index)),
                        separatorBuilder: (context, index) => Container(),
                        itemCount: controller.jobs.length))
              ],
            )),
          ],
        ),
      );
    });
  }

  Container buildRList(JobDetailController controller) {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Container(
                height: 20,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                margin: EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.center,
                child: Text(
                  controller.tags.elementAt(index),
                  style: TextStyle(color: Colors.white),
                ),
                decoration: BoxDecoration(
                    color: JobColors.primaryColor,
                    borderRadius: BorderRadius.circular(20)),
              ),
          separatorBuilder: (context, index) => SizedBox(
                width: 10,
              ),
          itemCount: controller.tags.length),
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
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  overflow: TextOverflow.ellipsis),
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

  Container buildSearch() {
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Search here...',
                    prefixIcon: Container(
                      padding: EdgeInsets.all(20),
                      child: SvgPicture.asset('assets/icons/search.svg'),
                    ),
                    contentPadding: EdgeInsets.all(2),
                  ),
                ),
              )),
          Container(
            height: 60,
            width: 70,
            margin: EdgeInsets.all(15),
            child: Icon(
              Icons.menu,
              size: 30,
              color: Colors.white,
            ),
            decoration: BoxDecoration(
                color: Colors.amberAccent,
                borderRadius: BorderRadius.circular(33)),
          )
        ],
      ),
    );
  }

  Container buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: JobColors.primaryColor,
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30,
            ),
          ),
          Row(
            children: [
              SvgPicture.asset(
                "assets/icons/notification.svg",
                height: 30,
              ),
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.more_horiz,
                size: 30,
              )
            ],
          )
        ],
      ),
    );
  }

  Row buildBg() {
    return Row(
      children: [
        Expanded(
          child: Container(),
          flex: 3,
        ),
        Expanded(
          child: Container(
            color: Colors.grey.withOpacity(0.1),
          ),
          flex: 2,
        )
      ],
    );
  }
}
