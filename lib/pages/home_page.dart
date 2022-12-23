import 'package:app_mobile_social_ui_kit_app_master/data/post_json.dart';
import 'package:app_mobile_social_ui_kit_app_master/data/user_json.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:app_mobile_social_ui_kit_app_master/theme/colors.dart';
import 'package:flutter_icons/flutter_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar:
          PreferredSize(child: getAppBar(), preferredSize: Size.fromHeight(60)),
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Feed",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        width: 58,
                        height: 58,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(colors: [
                              Color(0xFFFFF0DF),
                              Color(0xFFF1F6F4)
                            ])),
                        child: Center(
                          child: Icon(Icons.add, color: black, size: 28),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Row(
                          children: List.generate(usersList.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Container(
                            width: 58,
                            height: 58,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(usersList[index]['img']),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        );
                      }))
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: List.generate(postsList.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 288,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: grey.withOpacity(0.4),
                                  spreadRadius: 2,
                                  blurRadius: 15,
                                  offset: Offset(0, 1))
                            ],
                            image: DecorationImage(
                              image: NetworkImage(postsList[index]['postImg']),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      Container(
                        width: double.infinity,
                        height: 288,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: black.withOpacity(0.25)),
                      ),
                      Container(
                        width: double.infinity,
                        height: 288,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            postsList[index]['img']),
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            postsList[index]['name'],
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: white,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            postsList[index]['time'],
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: white.withOpacity(0.8),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Icon(
                                    Entypo.dots_three_vertical,
                                    color: white,
                                    size: 20,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: 70,
                                    height: 27,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(27),
                                      color: Color(0xFFE5E5E5).withOpacity(0.5),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          Feather.heart,
                                          color: white,
                                          size: 14,
                                        ),
                                        Text(
                                          postsList[index]['like'],
                                          style: TextStyle(
                                              fontSize: 13, color: white),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 70,
                                    height: 27,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(27),
                                      color: Color(0xFFE5E5E5).withOpacity(0.5),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          MaterialIcons.chat_bubble_outline,
                                          color: white,
                                          size: 14,
                                        ),
                                        Text(
                                          postsList[index]['comment'],
                                          style: TextStyle(
                                              fontSize: 13, color: white),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 70,
                                    height: 27,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(27),
                                      color: Color(0xFFE5E5E5).withOpacity(0.5),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          Icons.share,
                                          color: white,
                                          size: 14,
                                        ),
                                        Text(
                                          postsList[index]['share'],
                                          style: TextStyle(
                                              fontSize: 13, color: white),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: white,
      title: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Social UI KIT",
              style: TextStyle(
                  fontSize: 18, color: black, fontWeight: FontWeight.bold),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Feather.bell,
                  color: black,
                  size: 25,
                ))
          ],
        ),
      ),
    );
  }
}
