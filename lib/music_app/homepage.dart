import 'package:flutter/material.dart';
import 'package:my_app/models/database.dart';
import 'package:my_app/music_app/searchPage.dart';
import 'package:my_app/music_colors/app_colors.dart' as AppColors;
import 'Circle_track.dart';
import 'LogIn/log.dart';
import 'Player_home.dart';
import '../music_app/searchPage.dart';
import 'Track_Widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> text = ["most", "popular", "960 playlist"];
  @override
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.grey[900],
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            showSearch(context: context, delegate: CustomSearchDelegate());
          },
          icon: Icon(Icons.search),
        ),
        actions: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello Begench",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Turkmenistan",
                style: TextStyle(fontSize: 10),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Log_i(),
                    ),
                  );
                });
              },
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Cont(text[0]),
                Cont(text[1]),
                Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    top: 10,
                    bottom: 20,
                  ),
                  child: Text(
                    text[2],
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Container(
                  height: screenHeight * 0.35,
                  child: TrackWidget(refresh),
                ),
                CircleTrackWidget(
                  song: newRealese,
                  title: "new releases",
                  subtitle: "3465 song",
                  notifyParent: refresh,
                ),
                CircleTrackWidget(
                  song: mostPopular,
                  title: "your Playlist",
                  subtitle: "65 song",
                  notifyParent: refresh,
                ),
                SizedBox(
                  height: screenHeight * 0.20,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: PlayerHome(currentSong),
          )
        ],
      ),
    );
  }

  Widget Cont(
    String text,
  ) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: AppColors.temp,
        ),
      ),
    );
  }

  refresh() {
    setState(() {});
  }
}

Song currentSong = Song(
    name: "Don't worry...",
    singer: "Bob Marley",
    image: "assets/HomeCovers.png",
    duration: 100,
    url: "https://mp3uk.net/mp3/files/imagine-dragons-bones-mp3.mp3",
    color: AppColors.temp2);
double currentSlider = 0;
