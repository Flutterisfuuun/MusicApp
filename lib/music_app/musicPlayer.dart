import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_app/music_app/homepage.dart';
import 'package:my_app/music_colors/app_colors.dart' as AppColors;
import '../models/database.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicPlayer extends StatefulWidget {
  final Song index;
  MusicPlayer(this.index);

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  final player = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    setAudio();

    super.initState();

    player.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });
    //LISTEN TO AUDIO DURATIOM
    player.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    //Listen to audio position
    player.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  String? time(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes);
    final seconds = twoDigits(duration.inSeconds);

    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(":");
  }

  Future setAudio() async {
    player.setReleaseMode(ReleaseMode.loop);
    String url = widget.index.url;
    player.setSourceUrl(widget.index.url);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: "image",
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.index.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
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
                padding: EdgeInsets.only(right: 8, left: 15),
                child: Icon(
                  Icons.notifications_active_outlined,
                  size: 30,
                ),
              ),
            ],
          ),
          body: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 10, left: 20, right: 20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 14,
                    spreadRadius: 16,
                    color: Colors.black.withOpacity(0.2),
                  )
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                  child: Container(
                    height: 280,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        width: 1.5,
                        color: Colors.white.withOpacity(0.2),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(left: 20, right: 20, top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                widget.index.name,
                                style: TextStyle(
                                    color: AppColors.temp,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 40,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            widget.index.singer,
                            style: TextStyle(
                              color: AppColors.temp,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              thumbShape:
                                  RoundSliderThumbShape(enabledThumbRadius: 2),
                              trackShape: RectangularSliderTrackShape(),
                              trackHeight: 6,
                            ),
                            child: Slider(
                              min: 0,
                              max: duration.inSeconds.toDouble(),
                              value: position.inSeconds.toDouble(),
                              onChanged: (value) async {
                                final position =
                                    Duration(seconds: value.toInt());
                                await player.seek(position);

                                await player.resume;
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                duration.toString().split(".")[0],
                                //  time(duration) ?? "",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                time(duration - position) ?? "",
                                //  time(duration - position) ?? "",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.skip_previous_outlined,
                              color: AppColors.temp,
                              size: 40,
                            ),
                            IconButton(
                              onPressed: () async {
                                if (isPlaying) {
                                  await player.pause();
                                } else {
                                  await player.resume();
                                }
                              },
                              icon: Icon(
                                  isPlaying ? Icons.pause : Icons.play_arrow),
                              iconSize: 50,
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.skip_next_outlined,
                                size: 40,
                                color: AppColors.temp,
                              ),
                              onPressed: () {
                                // this.widget.index.setPlayBackRate(1.5);
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.replay_outlined,
                              size: 40,
                              color: AppColors.temp,
                            ),
                            Icon(
                              Icons.shuffle_outlined,
                              size: 40,
                              color: AppColors.temp,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
