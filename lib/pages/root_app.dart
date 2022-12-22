import 'package:app_mobile_social_ui_kit_app_master/pages/chat_page.dart';
import 'package:app_mobile_social_ui_kit_app_master/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'dart:math' as math;

import 'home_page.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: getFooter(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: getFloatingButton(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: activeTab,
      children: [
        HomePage(),
        ChatPage(),
        Center(
          child: Text("add"),
        ),
        Center(
          child: Text("heart"),
        ),
        Center(
          child: Text("user"),
        ),
      ],
    );
  }

  Widget getFooter() {
    return Container(
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            spreadRadius: 1,
            blurRadius: 20,
            offset: Offset(0, 1),
          )
        ],
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      activeTab = 0;
                    });
                  },
                  child: Icon(
                    Feather.home,
                    size: 25,
                    color: activeTab == 0 ? primary : black,
                  ),
                ),
                SizedBox(
                  width: 55,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      activeTab = 1;
                    });
                  },
                  child: Icon(
                    MaterialIcons.chat_bubble_outline,
                    size: 25,
                    color: activeTab == 1 ? primary : black,
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
              ],
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      activeTab = 3;
                    });
                  },
                  child: Icon(
                    Feather.heart,
                    size: 25,
                    color: activeTab == 3 ? primary : black,
                  ),
                ),
                SizedBox(
                  width: 55,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      activeTab = 4;
                    });
                  },
                  child: Icon(
                    MaterialIcons.account_circle,
                    size: 25,
                    color: activeTab == 4 ? primary : black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getFloatingButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          activeTab = 2;
        });
      },
      child: Transform.rotate(
        angle: -math.pi / 4,
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                spreadRadius: 2,
                blurRadius: 15,
                offset: Offset(0, 1)),
          ], color: black, borderRadius: BorderRadius.circular(23)),
          child: Transform.rotate(
            angle: -math.pi / 4,
            child: Center(
              child: Icon(
                Ionicons.md_add_circle_outline,
                color: white,
                size: 26,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
