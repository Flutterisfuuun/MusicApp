import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../models/list_music.dart';
import '../music_app/listmusic.dart';
import 'package:my_app/music_colors/app_colors.dart' as AppColors;

class Music_palay_screen extends StatefulWidget {
  final listofMusic index;
  Music_palay_screen(this.index);

  @override
  State<Music_palay_screen> createState() => _Music_palay_screenState();
}

class _Music_palay_screenState extends State<Music_palay_screen> {
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
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.grey[900],
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(
              context,
              MaterialPageRoute(
                builder: ((context) => List_music()),
              ),
            );
          },
          child: Icon(
            Icons.arrow_back_ios_new_sharp,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage(widget.index.image),
              // child: Image.network(
              //   widget.index.image,
              //   width: double.infinity,
              //   height: 300,
              //   fit: BoxFit.cover,
              // ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              widget.index.name,
              overflow: TextOverflow.fade,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              widget.index.singer,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Slider(
              min: 0,
              max: duration.inSeconds.toDouble(),
              value: position.inSeconds.toDouble(),
              onChanged: (value) async {
                final position = Duration(seconds: value.toInt());
                await player.seek(position);

                await player.resume;
              },
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(time(duration) ?? ""),
                  Text(time(duration - position) ?? ""),
                ],
              ),
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.skip_previous,
                  color: AppColors.temp,
                  size: 50,
                ),
                SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: () async {
                    if (isPlaying) {
                      await player.pause();
                    } else {
                      await player.resume();
                    }
                  },
                  icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                  iconSize: 50,
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.skip_next,
                  color: AppColors.temp,
                  size: 50,
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     btnSlow(),
            // IconButton(
            //   onPressed: () async {
            //     if (isPlaying) {
            //       await player.pause();
            //     } else {
            //       await player.resume();
            //     }
            //   },
            //   icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
            //   iconSize: 50,
            // ),
            //     btnFast(),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  Widget btnSlow() {
    return IconButton(
      icon: Icon(
        Icons.skip_previous,
        size: 50,
        color: Colors.white,
      ),
      onPressed: () {},
    );
  }

  Widget btnFast() {
    return IconButton(
      icon: Icon(
        Icons.skip_next_outlined,
        size: 50,
        color: Colors.white,
      ),
      onPressed: () {},
    );
  }
}
