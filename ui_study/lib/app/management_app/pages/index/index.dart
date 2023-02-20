import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_study/app/management_app/model/model.dart';
import '../../../../common/routers/app_routes.dart';
import '../../widgets/management_tasks_card.dart';
import 'controller.dart';

class ManagementIndexPage extends GetView<ManagementIndexController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ManagementIndexController>(builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Column(
            children: [
              buildAppbar(),
              // SizedBox(height: 20),
              buildHeaderCard(),
              Expanded(child: ManagementTasksCard())
            ],
          ),
        ),
        bottomNavigationBar: buildBottomNavigationBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // bottomNavigationBar 中间
        floatingActionButton: buildFloatingActionButton(),
      );
    });
  }

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 0,
      backgroundColor: Colors.black,
      onPressed: () {},
      child: Icon(
        Icons.add,
        size: 35,
      ),
    );
  }

  Container buildBottomNavigationBar() {
    return Container(
      height: 100,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            blurRadius: 10,
            offset: Offset(2, 2),
          )
        ],
      ),
      child: BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        items: [
          BottomNavigationBarItem(
            label: "home",
            icon: Icon(
              Icons.home,
              size: 30,
            ),
          ),
          BottomNavigationBarItem(
            label: "person",
            icon: Icon(
              Icons.person,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAppbar() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 0),
                  height: 45,
                  width: 45,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage("assets/images/avatar.jpeg"),
                        fit: BoxFit.cover,
                      )),
                ),
                SizedBox(
                  width: 18,
                ),
                Text("Hi, Amanda!",
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.w500,
                    ))
              ],
            ),
            Icon(
              Icons.more_vert,
              color: Colors.black,
              size: 30,
            )
          ],
        ),
      ),
    );
  }

  Widget buildHeaderCard() {
    return Container(
      height: 130,
      width: double.infinity,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(25)),
      child: Stack(
        children: [
          Positioned(
              top: 20,
              left: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    child: Icon(
                      Icons.star,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Go Premium!",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Get unlimited access\nto all our features!",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  )
                ],
              )),
          Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 50,
                height: 50,
                child: Icon(
                  Icons.arrow_forward_outlined,
                  color: Colors.white,
                  size: 30,
                ),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15)),
              ))
        ],
      ),
    );
  }
}
