// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:netflix_clone_api/Widgets/comming.dart';
import 'package:netflix_clone_api/Widgets/custom.dart';
import 'package:netflix_clone_api/Widgets/tabbar.dart';
import 'package:netflix_clone_api/functins/function.dart';
import 'package:netflix_clone_api/screens/homescreen.dart';

class NewsAndHot extends StatefulWidget {
  const NewsAndHot({super.key});

  @override
  State<NewsAndHot> createState() => _NewsAndHotState();
}

class _NewsAndHotState extends State<NewsAndHot> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('News & Hot',
          style: TextStyle(color: Colors.white,fontSize: 23),
          ),
          actions: [IconButton(onPressed: (){},
           icon: Icon(Icons.search,
           color: Colors.white,))],
           bottom: PreferredSize(preferredSize: Size.fromHeight(40),
            child: ValueListenableBuilder(valueListenable: tabNotifier
            , builder: (context, isTabBarVisible,_){
              return isTabBarVisible 
              ? HomeTabBar(
                first: 'Comming Soon🍿',
                second: 'Most Watching🔥',
              ):SizedBox();
            }),
            ),
        ),
        body: TabBarView(children: [
          SingleChildScrollView(
            child: CustomCommingSoon(gridList: popularMoviesList),
          ),
          // SingleChildScrollView(
          //   child: CustomGrid(
          //     gridList: topRatedList,
          //   ),
          // )
          SingleChildScrollView(
            child: CustomCommingSoon(gridList: popularMoviesList),
          ),
        ]),
      ),);
  }
}