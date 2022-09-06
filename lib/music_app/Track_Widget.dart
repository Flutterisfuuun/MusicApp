import 'package:flutter/material.dart';
import 'package:my_app/models/database.dart';
import 'package:my_app/music_app/homepage.dart';
import 'package:my_app/music_colors/app_colors.dart' as AppColors;

///Class for TrackWidget

class TrackWidget extends StatelessWidget {
  final Function() notifyParent;
  const TrackWidget(this.notifyParent);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return ListView.builder(
      itemCount: mostPopular.length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            currentSong = mostPopular[index];
            currentSlider = 0;
            notifyParent();
          },
          child: Container(
            margin: EdgeInsets.all(10),
            width: screenWidth * 0.45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: mostPopular[index].color,
                  blurRadius: 1,
                  spreadRadius: 0.3,
                ),
              ],
              image: DecorationImage(
                image: AssetImage(mostPopular[index].image),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    mostPopular[index].name,
                    style: TextStyle(
                      color: AppColors.temp,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    mostPopular[index].singer,
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.end,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
