// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

import 'package:netflix_clone_api/Widgets/cuatomprofile.dart';
//import 'package:netflix/widgets/custom_profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.menu))
        ],
        backgroundColor: Colors.transparent,
        title: Text(
          'My Netflix',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: CustomProfile(),
      ),
    );
  }
}