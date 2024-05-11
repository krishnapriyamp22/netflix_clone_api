// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:netflix_clone_api/functins/function.dart';
import 'package:netflix_clone_api/repo/api.dart';
import 'package:netflix_clone_api/screens/bottom_nav/bottom.dart';
import 'package:netflix_clone_api/screens/homescreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nowPlaying();
    getPopularMovies();
    getAllmovies();
    getToprated();
    super.initState();
    
    

  }
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (home) => BottonNavigation()),
          (route) => false);
    });
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.network('https://i.pinimg.com/originals/f6/b1/1b/f6b11bd53411d94338117381cf9a9b9b.gif')],
        ),
      ),
    );
  }
}