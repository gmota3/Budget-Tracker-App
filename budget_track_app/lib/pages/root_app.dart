import 'package:budget_track_app/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'daily_page.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});


  @override
  _RootAppState createState() => _RootAppState();

}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getFooter(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setTabs(4);
        },
        backgroundColor: primary,
        child: const FaIcon(FontAwesomeIcons.plus, size: 25),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [
          DailyPage(),
        const Center(
          child: Text("Stats Page"),
        ),
        const Center(
          child: Text("Budget Page"),
        ),
        const Center(
          child: Text("Profile Page"),
        ),
        const Center(
          child: Text("Create budget Page"),
        )
      ]
    );
  }
  Widget getFooter() {
    List<IconData> iconItems = [
      FontAwesomeIcons.calendar,
      FontAwesomeIcons.circleInfo,
      FontAwesomeIcons.wallet,
      FontAwesomeIcons.person,

    ];
    return AnimatedBottomNavigationBar(
        icons: iconItems,
        activeColor: primary,
        splashColor: secondary,
        inactiveColor: black.withOpacity(0.5),
        activeIndex: pageIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 10,
        iconSize: 25,
        rightCornerRadius: 10,
        onTap: (index){
          setTabs(index);
        });
  }
  setTabs(index){
    setState(() {
      pageIndex = index;
    });
  }

}
