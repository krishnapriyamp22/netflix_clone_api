// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:netflix_clone_api/Widgets/customlist.dart';
import 'package:netflix_clone_api/functins/function.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List _fullMovies=[];
  Timer? _debounce;
  String searchText='';
  TextEditingController searchController=TextEditingController();
  @override
  void initState() {
    _fullMovies = allMoviesList;
    searchController.addListener(onSearch);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('search for Movies',
        style: TextStyle(color: Colors.white),),

      ),
      body: Column(
        children: [SizedBox(
          height: 10,
        ),TextFormField(
          onChanged: onSearch(),
          controller: searchController,
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          decoration: InputDecoration(
            suffixIcon: searchController.text.isEmpty?
            Icon(Icons.mic,
            color: Colors.white,):IconButton(
              onPressed: (){
                searchController.clear();
              }
            , icon: Icon(Icons.clear,
            color: Colors.white,)),
            prefixIcon: Icon(Icons.search,
            color: Colors.white,),
            fillColor:  Color.fromARGB(255, 141, 136, 136),
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            hintStyle: TextStyle(color: Colors.white),
            hintText: 'search Movies'

          ),
        ),
        Expanded(child: Curstom_list(searchText: searchText,fullMovies: _fullMovies,))
        ],
      ),
      
    );
  }
  onSearch() {
    setState(() {});
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(Duration(milliseconds: 500), () {
      if (searchText != searchController.text) {
        setState(() {
          _fullMovies = allMoviesList
              .where((element) => element
                  .toString()
                  .toLowerCase()
                  .contains(searchController.text.toString().toLowerCase()))
              .toList();
        });
      }
      searchText = searchController.text;
    });
  }

}