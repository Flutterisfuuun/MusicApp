import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Music_Player/musi_play_screen.dart';
import 'package:my_app/music_app/homepage.dart';

import '../models/list_music.dart';

class List_music extends StatefulWidget {
  @override
  State<List_music> createState() => _List_musicState();
}

class _List_musicState extends State<List_music> {
  bool a = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.grey[900],
        elevation: 0,
        title: Text(
          "My music list",
          style: TextStyle(color: Colors.amber, fontSize: 20),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
                onTap: () {
                  setState(() {
                    a = !a;
                  });
                },
                child:
                    Icon(a ? Icons.favorite_outline_outlined : Icons.favorite)),
          ),
        ],
      ),
      body: ListMusic(refresh),
    );
  }

  refresh() {
    setState(() {});
  }
}

class ListMusic extends StatelessWidget {
  final Function() notifyParent;
  ListMusic(this.notifyParent);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: enjoySong.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            currentAydym = enjoySong[index];
            currentSlider = 0;
            notifyParent();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Music_palay_screen(currentAydym),
              ),
            );
          },
          child: ListTile(
            leading: CircleAvatar(
              
              backgroundImage: NetworkImage(enjoySong[index].image),
            ),
            title: Text(
              enjoySong[index].name,
            ),
            subtitle: Text(
              enjoySong[index].singer,
            ),
            trailing: Icon(Icons.more_horiz),
          ),
        );
      },
    );
  }
}

listofMusic currentAydym = listofMusic(
  name: "Don't worry,Be Happy",
  singer: "Bob Marley",
  image: "assets/HomeCovers.png",
  url: "https://mp3uk.net/mp3/files/miyagi-andy-panda-patron-mp3.mp3",
  duration: 100,
);
double currentSlider = 0;
