import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone_api/Widgets/appbar.dart';
import 'package:netflix_clone_api/Widgets/card.dart';
import 'package:netflix_clone_api/functins/function.dart';
import 'package:netflix_clone_api/repo/api.dart';
import 'package:netflix_clone_api/screens/detail.dart';
ValueNotifier<bool> tabNotifier = ValueNotifier(true);

class HomeSxcreen extends StatefulWidget {
  const HomeSxcreen({super.key});

  @override
  State<HomeSxcreen> createState() => _HomeSxcreenState();
}

class _HomeSxcreenState extends State<HomeSxcreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3,
     child: RefreshIndicator(
      backgroundColor: Colors.transparent,
      color: Colors.white,
      onRefresh:() async{
        await Future.delayed(Duration(seconds: 2),
        (){
          setState(() {
            
          });
        });
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        appBar: appBar(context),
        body: NotificationListener<UserScrollNotification>(
          onNotification:(notification){
            final ScrollDirection direction=notification.direction;
            if(direction==ScrollDirection.reverse){
                tabNotifier.value=false;
            }else if(direction==ScrollDirection.forward){
              tabNotifier.value=true;
            }
            return true;
          },
          child: SingleChildScrollView(
            child: Padding(padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 119,
                ),
                Center(
                  child: cardHome(),
                ),
                CustomSlider(title: 'Now playing', sliderlist: nowplayinglist),
                CustomSlider(title: 'Top Rated', sliderlist: popularMoviesList)
              ],
            ),),
          ),
        ),
      ),
     // onRefresh: onRefresh
      ));
      
  }
}
class CustomSlider extends StatefulWidget {
  String title;
  List<Map<String, dynamic>> sliderlist;
  CustomSlider({super.key, required this.title, required this.sliderlist});

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 13,
            ),
            Text(
              widget.title,
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w100),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: widget.sliderlist.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (details) => DetailsPage(
                                    moviename: widget.sliderlist[index]
                                        ['title'],
                                    image: imageApi +
                                        widget.sliderlist[index]['poster_path'],
                                    title: widget.title,
                                    details: widget.sliderlist[index]
                                        ['overview']))
                                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: SizedBox(
                            height: 150,
                            width: 150,
                            child: Image.network(
                                filterQuality: FilterQuality.high,
                                fit: BoxFit.cover,
                                imageApi +
                                widget.sliderlist[index]['poster_path']),
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        )
      ],
    );
  }
}
