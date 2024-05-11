import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_clone_api/repo/api.dart';


List<Map<String, dynamic>> nowplayinglist = [];
List<Map<String, dynamic>> popularMoviesList = [];
List<Map<String, dynamic>> topRatedList = [];
List<Map<String, dynamic>> allMoviesList = [];

Future<void> nowPlaying() async {
  final nowPlayingResponse = await http.get(Uri.parse(nowplaying));
  if (nowPlayingResponse.statusCode == 200) {
    var data = jsonDecode(nowPlayingResponse.body);
    List nowPlayingjson = data['results'];
    for (var i = 0; i < nowPlayingjson.length; i++) {
      nowplayinglist.add({
        'title': nowPlayingjson[i]['title'],
        'backdrop_path': nowPlayingjson[i]['backdrop_path'],
        'overview': nowPlayingjson[i]['overview'],
        'vote_average': nowPlayingjson[i]['vote_average'],
        'relese_data': nowPlayingjson[i]['relese_data'],
        'poster_path': nowPlayingjson[i]['poster_path'],
        'id': nowPlayingjson[i]['id'],
        'popularity': nowPlayingjson[i]['popularity'],
        'indexno': i
      });
    }
    print(nowplaying.length);
  } else {
    throw Exception(const Text(
      'Cant\'load Now playing',
      style: TextStyle(color: Colors.white),
    ))
    ;
  }
}

Future<void> getPopularMovies() async {
  final response = await http.get(Uri.parse(popular));
  if (response.statusCode == 200) {
    var tempData = jsonDecode(response.body);
    var popularMovies = tempData['results'];
    for (int i = 0; i < popularMovies.length; i++) {
      popularMoviesList.add({
        'title': popularMovies[i]['title'],
        'backdrop_path': popularMovies[i]['backdrop_path'],
        'overview': popularMovies[i]['overview'],
        'vote_average': popularMovies[i]['vote_average'],
        'release_date': popularMovies[i]['release_date'],
        'poster_path': popularMovies[i]['poster_path'],
      });
    }
  } else {
    throw Exception("error loading popular movies");
  }
}

Future<void> getToprated() async {
  final topRatedResponse = await http.get(Uri.parse(toprated));
  if (topRatedResponse.statusCode == 200) {
    var tempdata = jsonDecode(topRatedResponse.body);
    List toprated = tempdata['results'];
    for (int i = 0; i < toprated.length; i++) {
      topRatedList.add({
        'title': toprated[i]['title'],
        'backdrop_path': toprated[i]['backdrop_path'],
        'overview': toprated[i]['overview'],
        'vote_average': toprated[i]['vote_average'],
        'release_date': toprated[i]['release_date'],
        'poster_path': toprated[i]['poster_path'],
        'indexno': i
      });
    }
  } else {
    throw Exception('error loading toprated movies');
  }
}

Future<void> getAllmovies() async {
  final response = await http.get(Uri.parse(allmoveis));
  if (response.statusCode == 200) {
    var tempdata = jsonDecode(response.body);
    List allmovies = tempdata['results'];
    for (var i = 0; i < allmovies.length; i++) {
      allMoviesList.add({
        'title': allmovies[i]['title'],
        'backdrop_path': allmovies[i]['backdrop_path'],
        'overview': allmovies[i]['overview'],
        'vote_average': allmovies[i]['vote_average'],
        'release_date': allmovies[i]['release_date'],
        'poster_path': allmovies[i]['poster_path'],
      });
    }
  } else {
    throw Exception('error loading all movies');
  }
}