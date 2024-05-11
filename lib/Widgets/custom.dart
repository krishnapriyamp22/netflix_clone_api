// ignore_for_file: unnecessary_string_interpolations, avoid_unnecessary_containers, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:netflix_clone_api/repo/api.dart';
//import 'package:netflix/apiKey/api_key.dart';

class CustomGrid extends StatefulWidget {
  List<Map<String, dynamic>> gridList;
  CustomGrid({super.key, required this.gridList});

  @override
  State<CustomGrid> createState() => _CustomGridState();
}

class _CustomGridState extends State<CustomGrid> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 1000,
            child: ListView.builder(
                itemCount: widget.gridList.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 300,
                          width: double.infinity,
                          child: Image.network(
                            imageApi + widget.gridList[index]['poster_path'],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 8, bottom: 2, left: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 210,
                                child: Text(
                                  widget.gridList[index]['title'],
                                  style: GoogleFonts.rubik(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.share,
                                        color: Colors.white,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.play_arrow,
                                        color: Colors.white,
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 6, bottom: 5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.gridList[index]['release_date'],
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                '🔥${widget.gridList[index]['vote_average'].toString()}',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 3, right: 3, bottom: 20),
                          child: Text(
                            widget.gridList[index]['overview'],
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Divider(),
                        SizedBox(
                          height: 25,
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}