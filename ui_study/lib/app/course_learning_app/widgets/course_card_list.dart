import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/routers/app_routes.dart';
import '../constants/colors.dart';
import '../model/model.dart';

class CourseCardList extends StatelessWidget {
  final List<Course> courseList;

  const CourseCardList({Key? key, required this.courseList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Container(
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(
                        AppRoutes.pathJoin(
                            [AppRoutes.CourseLearning, AppRoutes.Detail]),
                        arguments: {
                          "course": courseList.elementAt(index),
                        });
                  },
                  child: CourseCard(
                    img: courseList.elementAt(index).img,
                    auth: courseList.elementAt(index).auth,
                    description: courseList.elementAt(index).description,
                  ),
                ),
              ),
          separatorBuilder: (context, index) => SizedBox(
                width: 20,
              ),
          itemCount: courseList.length),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String img;
  final String auth;
  final String description;

  const CourseCard({
    super.key,
    required this.img,
    required this.auth,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 300,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(img),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                color: CourseLearColors.kPrimary,
                width: double.infinity,
                padding: EdgeInsets.all(10),
                clipBehavior: Clip.none,
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage("assets/images/avatar.jpeg"),
                                ),
                                height: 30,
                              ),
                              Text(
                                "  $auth",
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: description,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: "       * ",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black45,
                                ),
                              ),
                              TextSpan(
                                text: "2h 22 min",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black45,
                                ),
                              ),
                            ]),
                          )
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
          Positioned(
              top: 180,
              right: 15,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "Start",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                height: 40,
                width: 80,
                decoration: BoxDecoration(
                    color: Colors.orange.shade600,
                    borderRadius: BorderRadius.circular(10)),
              ))
        ],
      ),
    );
  }
}
