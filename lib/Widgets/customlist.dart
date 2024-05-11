// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone_api/repo/api.dart';
import 'package:netflix_clone_api/screens/detail.dart';



class Curstom_list extends StatefulWidget {
  Curstom_list({
    super.key,
    required this.searchText,
    required this.fullMovies,
  });
  String searchText;
  List fullMovies;
  @override
  State<Curstom_list> createState() => _CurstomlistState();
}

class _CurstomlistState extends State<Curstom_list> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: (widget.searchText.isEmpty)
            ? ListView.builder(
                // scrollDirection: Axis.vertical,
                //physics: BouncingScrollPhysics(),
                itemCount: widget.fullMovies.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (detail) => DetailsPage(
                                  moviename: widget.fullMovies[index]['title'],
                                  image: imageApi +
                                      widget.fullMovies[index]['poster_path'],
                                  title: 'Popular Movies',
                                  details: widget.fullMovies[index]
                                      ['overview'])));
                    },
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 12, left: 5, right: 5),
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                    height: 150,
                                    width: 135,
                                    child: Image.network(
                                      imageApi +
                                          widget.fullMovies[index]
                                              ['poster_path'],
                                      fit: BoxFit.cover,
                                    )),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 100,
                                      child: Text(
                                        'Title : ${widget.fullMovies[index]['title']}',
                                        style: GoogleFonts.rubik(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13.2,
                                            color: const Color.fromARGB(
                                                255, 255, 255, 255)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Vote : ${widget.fullMovies[index]['release_date'].toString()}",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Data : ${widget.fullMovies[index]['vote_average'].toString()}",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.play_arrow,
                                      size: 30,
                                      color: Colors.white,
                                    ))
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Divider(),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                })
            : (widget.fullMovies.isEmpty)
                ? Column(children: const [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Oops.We haven't got that.",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Try searching for another movies",
                      style:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    )
                  ])
                : ListView.builder(
                    // scrollDirection: Axis.vertical,
                    //physics: BouncingScrollPhysics(),
                    itemCount: widget.fullMovies.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (detail) => DetailsPage(
                                      moviename: widget.fullMovies[index]
                                          ['title'],
                                      image: imageApi +
                                          widget.fullMovies[index]
                                              ['poster_path'],
                                      title: 'Popular Movies',
                                      details: widget.fullMovies[index]
                                          ['overview'])));
                        },
                        child: Padding(
                          padding:
                              const EdgeInsets.only(top: 12, left: 5, right: 5),
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                        height: 150,
                                        width: 135,
                                        child: Image.network(
                                          imageApi +
                                              widget.fullMovies[index]
                                                  ['poster_path'],
                                          fit: BoxFit.cover,
                                        )),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Title : ${widget.fullMovies[index]['title']}',
                                          style: GoogleFonts.rubik(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13.2,
                                              color: const Color.fromARGB(
                                                  255, 255, 255, 255)),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Vote : ${widget.fullMovies[index]['release_date'].toString()}",
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Data : ${widget.fullMovies[index]['vote_average'].toString()}",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.play_arrow,
                                          size: 30,
                                          color: Colors.white,
                                        ))
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 12),
                                  child: Divider(),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }));
  }
}