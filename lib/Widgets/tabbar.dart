// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class HomeTabBar extends StatefulWidget {
  HomeTabBar({
    super.key,
    this.first,
    this.second,
    this.third,
  });
  String? first;
  String? second;

  String? third;

  @override
  State<HomeTabBar> createState() => _HomeTabBarState();
}

class _HomeTabBarState extends State<HomeTabBar> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: [
        Tab(
          text: '${widget.first}',
        ),
        Tab(
          text: '${widget.second}',
        ),
        (widget.third != null)
            ? Tab(
                text: '${widget.third}',
              )
            : SizedBox()
      ],
      labelPadding: EdgeInsets.symmetric(horizontal: 16.0),
      dividerColor: Colors.black,
      unselectedLabelColor: Colors.white,
      indicatorColor: Colors.white,
      isScrollable: true,
      labelColor: Colors.red,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorWeight: 0.5,
      indicator: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(20)),
      indicatorPadding: const EdgeInsets.all(5),
    );
  }
}