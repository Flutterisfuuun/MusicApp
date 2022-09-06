import 'package:flutter/material.dart';
import 'package:my_app/music_app/Favorites.dart';
import 'package:my_app/music_app/homepage.dart';
import 'package:my_app/music_app/listmusic.dart';

class Bottom_Nav_Bar extends StatefulWidget {
  const Bottom_Nav_Bar({Key? key}) : super(key: key);

  @override
  State<Bottom_Nav_Bar> createState() => _Bottom_Nav_BarState();
}

class _Bottom_Nav_BarState extends State<Bottom_Nav_Bar> {
  int secilenMunuItem = 0;
  List nav = [];

  void initState() {
    HomeScreen home = HomeScreen();
    List_music music = List_music();
    // MusicFile play = MusicFile();
    favourites fav = favourites();
    nav = [home, music, fav];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: nav[secilenMunuItem],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.music_note_rounded,
            ),
            label: "My PlayList",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Favourites",
          ),
        ],
        currentIndex: secilenMunuItem,
        type: BottomNavigationBarType.fixed,
        onTap: (sana) {
          setState(
            () {
              secilenMunuItem = sana;
            },
          );
        },
      ),
    );
  }
}
