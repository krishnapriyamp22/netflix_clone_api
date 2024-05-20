// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone_api/repo/api.dart';
import 'package:netflix_clone_api/screens/detail.dart';

class CustomList extends StatefulWidget {
  CustomList({
    super.key,
    required this.searchText,
    required this.fullMovies,
  });
  String searchText;
  List fullMovies;

  @override
  State<CustomList> createState() => _CustomListState();
}

class _CustomListState extends State<CustomList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: (widget.searchText.isEmpty)
          ? ListView.builder(
              itemCount: widget.fullMovies.length,
              itemBuilder: (context, index) {
                var movie = widget.fullMovies[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(
                          moviename: movie['title'] ?? 'No Title',
                          image: imageApi + (movie['poster_path'] ?? ''),
                          title: 'Popular Movies',
                          details: movie['overview'] ?? 'No Details Available',
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12, left: 5, right: 5),
                    child: Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 150,
                                width: 135,
                                child: Image.network(
                                  imageApi + (movie['poster_path'] ?? ''),
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Icon(Icons.error, color: Colors.red);
                                  },
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Title: ${movie['title'] ?? "No Title"}',
                                      style: GoogleFonts.rubik(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13.2,
                                        color: Colors.white,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "Release Date: ${movie['release_date'] ?? "N/A"}",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "Rating: ${movie['vote_average']?.toString() ?? "N/A"}",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.play_arrow,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Divider(),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          : (widget.fullMovies.isEmpty)
              ? Column(
                  children: const [
                    SizedBox(height: 30),
                    Text(
                      "Oops. We haven't got that.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Try searching for another movie",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )
              : ListView.builder(
                  itemCount: widget.fullMovies.length,
                  itemBuilder: (context, index) {
                    var movie = widget.fullMovies[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(
                              moviename: movie['title'] ?? 'No Title',
                              image: imageApi + (movie['poster_path'] ?? ''),
                              title: 'Popular Movies',
                              details: movie['overview'] ?? 'No Details Available',
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 12, left: 5, right: 5),
                        child: Container(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height: 150,
                                    width: 135,
                                    child: Image.network(
                                      imageApi + (movie['poster_path'] ?? ''),
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) {
                                        return Icon(Icons.error, color: Colors.red);
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Title: ${movie['title'] ?? "No Title"}',
                                          style: GoogleFonts.rubik(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13.2,
                                            color: Colors.white,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          "Release Date: ${movie['release_date'] ?? "N/A"}",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          "Rating: ${movie['vote_average']?.toString() ?? "N/A"}",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.play_arrow,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: Divider(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
