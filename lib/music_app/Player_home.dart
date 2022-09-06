import 'package:flutter/material.dart';
import 'package:my_app/models/database.dart';
import 'package:my_app/music_app/homepage.dart';
import 'package:my_app/music_app/musicPlayer.dart';
import 'package:my_app/music_colors/app_colors.dart' as AppColors;

class PlayerHome extends StatefulWidget {
  final Song song;
  PlayerHome(this.song);

  @override
  State<PlayerHome> createState() => _PlayerHomeState();
}

class _PlayerHomeState extends State<PlayerHome> {
  List icons = [
    Icons.pause,
    Icons.pause,
    Icons.pause,
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, _, __) => MusicPlayer(widget.song),
          ),
        );
      },
      child: Container(
        height: 125,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.temp2,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Hero(
                      tag: "image",
                      child: CircleAvatar(
                        backgroundImage: AssetImage(widget.song.image),
                        radius: 30,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.song.name,
                      style: TextStyle(
                        color: AppColors.temp,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.song.singer,
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.skip_previous_outlined,
                      color: AppColors.temp,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.pause,
                      color: AppColors.temp,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.skip_next_outlined,
                      color: AppColors.temp,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  Duration(seconds: currentSlider.toInt())
                      .toString()
                      .split(".")[0]
                      .substring(2),
                  style: TextStyle(
                    color: AppColors.temp,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 120,
                  child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 4),
                        trackShape: RectangularSliderTrackShape(),
                        trackHeight: 4,
                      ),
                      child: Slider(
                          value: currentSlider,
                          max: widget.song.duration.toDouble(),
                          min: 0,
                          inactiveColor: Colors.grey[500],
                          activeColor: AppColors.temp,
                          onChanged: (val) {
                            setState(() {
                              currentSlider = val;
                            });
                          })),
                ),
                Text(
                  Duration(seconds: widget.song.duration)
                      .toString()
                      .split(".")[0]
                      .substring(2),
                  style: TextStyle(
                    color: AppColors.temp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget MusicIcons(index) {
    return Row(
      children: [
        Icon(
          icons[index],
          color: AppColors.temp,
          size: 30,
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
