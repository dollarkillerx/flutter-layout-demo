import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ui_study/app/job_app/constants/colors.dart';
import '../../widgets/left_list.dart';
import '../../widgets/more_card.dart';
import 'controller.dart';

class JobIndexPage extends GetView<JobIndexController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<JobIndexController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              buildBg(),
              Container(
                child: Column(
                  children: [
                    buildHeader(),
                    SizedBox(
                      height: 10,
                    ),
                    buildSearchCard(),
                    LeftList(),
                    SizedBox(
                      height: 10,
                    ),
                    MoreCard(),
                  ],
                ),
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          elevation: 0,
          backgroundColor: JobColors.accentColor,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        bottomNavigationBar: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: JobColors.primaryColor,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  label: 'Home',
                  icon: Icon(
                    Icons.home,
                    size: 20,
                  )),
              BottomNavigationBarItem(
                label: 'Case',
                icon: Icon(
                  Icons.cases_outlined,
                  size: 20,
                  color: Colors.grey,
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Container(),
              ),
              BottomNavigationBarItem(
                label: 'Pack',
                icon: Icon(
                  Icons.backpack_outlined,
                  size: 20,
                  color: Colors.grey,
                ),
              ),
              BottomNavigationBarItem(
                label: 'User',
                icon: Icon(
                  Icons.person_2_outlined,
                  size: 20,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  Container buildSearchCard() {
    return Container(
      height: 300,
      width: double.infinity,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/search_bg.png",
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Fast Search",
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "You can search quickly for\nthe job you want",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white.withOpacity(0.7),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            clipBehavior: Clip.antiAlias,
            height: 70,
            width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(40)),
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                hintText: 'Search here...',
                prefixIcon: Container(
                  padding: EdgeInsets.all(10),
                  child: SvgPicture.asset('assets/icons/search.svg'),
                ),
                // contentPadding: EdgeInsets.all(2),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome home",
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Annie Bryant",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  SvgPicture.asset("assets/icons/notification.svg"),
                  SizedBox(
                    width: 15,
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      "assets/images/avatar.jpeg",
                    ),
                  )
                ],
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
