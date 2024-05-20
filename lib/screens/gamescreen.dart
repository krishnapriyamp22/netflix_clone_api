// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:netflix_clone_api/Widgets/customlist.dart';
import 'package:netflix_clone_api/functins/function.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_clone_api/repo/api.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List _fullMovies = [];
  Timer? _debounce;
  String searchText = '';
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fullMovies = topRatedList;
    searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(Duration(milliseconds: 500), () {
      if (searchText != searchController.text) {
        setState(() {
          searchText = searchController.text;
        });
        _searchMovies();
      }
    });
  }

  Future<void> _searchMovies() async {
    if (searchText.isEmpty) return;

    String searchurl =
        "https://api.themoviedb.org/3/search/movie?query=${searchController.text}&api_key=$apikey";
    final response = await http.get(Uri.parse(searchurl));

    if (response.statusCode == 200) {
      var tempdata = jsonDecode(response.body);
      List toprated = tempdata['results'];
      setState(() {
        _fullMovies = toprated.map((movie) => {
          'title': movie['title'],
          'backdrop_path': movie['backdrop_path'],
          'overview': movie['overview'],
          'vote_average': movie['vote_average'],
          'release_date': movie['release_date'],
          'poster_path': movie['poster_path'],
        }).toList();
      });
    } else {
      throw Exception('Error loading top rated movies');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Search for Movies',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          TextFormField(
            onChanged: (text) => _onSearchChanged(),
            controller: searchController,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              suffixIcon: searchController.text.isEmpty
                  ? Icon(Icons.mic, color: Colors.white)
                  : IconButton(
                      onPressed: () {
                        searchController.clear();
                      },
                      icon: Icon(Icons.clear, color: Colors.white),
                    ),
              prefixIcon: Icon(Icons.search, color: Colors.white),
              fillColor: Color.fromARGB(255, 141, 136, 136),
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              hintStyle: TextStyle(color: Colors.white),
              hintText: 'Search Movies',
            ),
          ),
          Expanded(
            child: CustomList(
              searchText: searchText,
              fullMovies: _fullMovies,
            ),
          ),
        ],
      ),
    );
  }
}
