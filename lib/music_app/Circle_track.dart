import 'package:flutter/material.dart';
import 'package:my_app/music_app/homepage.dart';
import 'package:my_app/music_colors/app_colors.dart' as AppColors;
import 'package:my_app/models/database.dart';
// import'../models/circle_avatar.dart;

class CircleTrackWidget extends StatelessWidget {
// final List<CircleTrac> songs;

//   CircleTrac(this.songs);

  final String title;
  final List<Song> song;
  final String subtitle;
  final Function() notifyParent;

  const CircleTrackWidget(
      {required this.title,
      required this.song,
      required this.subtitle,
      required this.notifyParent});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, top: 10),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: AppColors.temp,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, top: 5),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          Container(
            height: screenHeight * 0.19,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: song.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    currentSong = song[index];
                    currentSlider = 0;
                    notifyParent();
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(song[index].image),
                          radius: 40,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          song[index].name,
                          style: TextStyle(color: AppColors.temp),
                        ),
                        Text(
                          song[index].singer,
                          style: TextStyle(color: Colors.white54),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
