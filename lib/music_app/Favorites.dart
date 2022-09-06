import 'package:flutter/material.dart';
import 'package:favorite_button/favorite_button.dart';

class favourites extends StatefulWidget {
  const favourites({Key? key}) : super(key: key);

  @override
  State<favourites> createState() => _favouritesState();
}

class _favouritesState extends State<favourites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.grey[900],
        elevation: 0,
      ),
      body: Favourite(),
    );
  }
}

class Favourite extends StatelessWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comment Us with Favourite comments'),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FavoriteButton(
                isFavorite: true,
                // iconDisabledColor: Colors.white,
                valueChanged: (_isFavorite) {
                  print('Is Favorite : $_isFavorite');
                },
              ),
              StarButton(
                isStarred: false,
                // iconDisabledColor: Colors.white,
                valueChanged: (_isStarred) {
                  print('Is Starred : $_isStarred');
                },
              )
            ],
          )),
    );
  }
}
