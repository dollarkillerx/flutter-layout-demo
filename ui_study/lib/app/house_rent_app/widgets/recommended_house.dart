import 'package:flutter/material.dart';
import 'package:ui_study/app/house_rent_app/model/house.dart';
import 'package:ui_study/app/house_rent_app/widgets/tag_icon.dart';

class RecommendedHouse extends StatelessWidget {
  final List<House> houses;

  const RecommendedHouse({Key? key, required this.houses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Container(
                height: 300,
                width: 200,
                padding: EdgeInsets.all(15),
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(houses.elementAt(index).imageUrl),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: Stack(
                    children: [
                      Positioned(
                        right: 5,
                        top: 10,
                        child: TagIcon(
                            bgColor: Colors.pinkAccent,
                            img: "assets/icons/mark.svg"),
                      ),
                      Positioned(
                          bottom: 5,
                          child: Container(
                            height: 50,
                            width: 200,
                            color: Colors.white.withOpacity(0.5),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Stack(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                houses.elementAt(index).name,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                houses.elementAt(index).address,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: TextStyle(),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(),
                                      )
                                    ],
                                  ),
                                  Positioned(
                                      right: 27,
                                      top: 4,
                                      child: TagIcon(
                                          bgColor: Colors.pinkAccent,
                                          img: 'assets/icons/heart.svg'))
                                ],
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
              ),
          separatorBuilder: (context, index) => SizedBox(
                width: 15,
              ),
          itemCount: houses.length),
    );
  }
}
