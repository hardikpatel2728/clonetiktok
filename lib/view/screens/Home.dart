import 'package:clonetiktok/constants.dart';
import 'package:flutter/material.dart';

import '../widget/customeAddIcon.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageidx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: backgroundColor,
          onTap: (index) {
            setState(() {
              pageidx = index;
            });
          },
          currentIndex: pageidx,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 25,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  size: 25,
                ),
                label: 'Search'),
            BottomNavigationBarItem(icon: customeAddIcon(), label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.message,
                  size: 25,
                ),
                label: 'Message'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 25,
                ),
                label: 'Profile'),
          ]),
      body: Center(
        child: pageindex[pageidx]
      ),
    );
  }
}
