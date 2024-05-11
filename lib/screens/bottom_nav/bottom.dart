// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:netflix_clone_api/screens/gamescreen.dart';
import 'package:netflix_clone_api/screens/homescreen.dart';
import 'package:netflix_clone_api/screens/newandhotscreen.dart';
import 'package:netflix_clone_api/screens/profilr.dart';

class BottonNavigation extends StatefulWidget {
  const BottonNavigation({super.key});

  @override
  State<BottonNavigation> createState() => _BottonNavigationState();
}

class _BottonNavigationState extends State<BottonNavigation> {
  int indexnum=0;
  List screen=[
    HomeSxcreen(),
    GameScreen(),
    NewsAndHot(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen.elementAt(indexnum),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
        items: [
          BottomNavigationBarItem(icon: InkResponse(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            child: Icon(Icons.home_outlined),
          ),label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: InkResponse(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              child: Icon(Icons.sports_esports_outlined),
            ),
            label: 'Games',
          ),
          BottomNavigationBarItem(
            icon: InkResponse(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              child: Icon(Icons.video_library_outlined),
            ),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: InkResponse(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              child: Icon(Icons.person_2_outlined),
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: indexnum,
        showSelectedLabels: true,
        iconSize: 30,
        showUnselectedLabels: true,
          selectedItemColor: Color.fromARGB(255, 255, 255, 255),
        unselectedItemColor: Color.fromARGB(255, 161, 151, 151),
        onTap: (int idx){
          setState(() {
            indexnum=idx;

          });
        },
        ),
     // backgroundColor: Colors.black,
  
    );
  }
}