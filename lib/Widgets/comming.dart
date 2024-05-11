// ignore_for_file: prefer_const_constructors, must_be_immutable, avoid_unnecessary_containers, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:netflix_clone_api/repo/api.dart';
//import 'package:netflix/apiKey/api_key.dart';


class CustomCommingSoon extends StatefulWidget {
  List<Map<String, dynamic>> gridList;
  CustomCommingSoon({super.key, required this.gridList});

  @override
  State<CustomCommingSoon> createState() => _CustomCommingSoonState();
}

class _CustomCommingSoonState extends State<CustomCommingSoon> {
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
                  DateTime releaseDate =
                      DateTime.parse(widget.gridList[index]['release_date']);
                  String date = DateFormat('dd').format(releaseDate);
                  String month = DateFormat('MMM').format(releaseDate);
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 18, right: 5),
                        child: Column(
                          children: [
                            Text(
                              month,
                              style: GoogleFonts.rubik(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              date,
                              style: GoogleFonts.rubik(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 300,
                                width: double.infinity,
                                child: Image.network(
                                  imageApi +
                                      widget.gridList[index]['poster_path'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 8, bottom: 2, left: 6),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                              Icons.notifications,
                                              color: Colors.white,
                                            )),
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.info_outline,
                                              color: Colors.white,
                                            )),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 3, bottom: 5),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Rating : ${widget.gridList[index]['vote_average'].toString()}',
                                    style: TextStyle(color: Colors.white),
                                  ),
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
                        ),
                      ),
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}