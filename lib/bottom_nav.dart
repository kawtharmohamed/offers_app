import 'package:flutter/material.dart';
import 'package:offersapp/resturants.dart';
import 'package:offersapp/main.dart';
import 'package:offersapp/profile.dart';
import 'home.dart';

class Bottom_nav extends StatefulWidget {
  @override
  State<Bottom_nav> createState() => _Bottom_navState();
}

class _Bottom_navState extends State<Bottom_nav> {
  int currentIndex = 0;
  List<Widget> screens = [
    Home(),
    Resturants(),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.place), label: 'Resturants'),
        ],
        selectedItemColor: purple,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
