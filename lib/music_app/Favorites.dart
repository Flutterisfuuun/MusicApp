import 'package:flutter/material.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:my_app/music_app/searchPage.dart';

class favourites extends StatefulWidget {
  const favourites({Key? key}) : super(key: key);

  @override
  State<favourites> createState() => _favouritesState();
}

class _favouritesState extends State<favourites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Favourite(),
    );
  }
}

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  bool a = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Make Your day with Music"),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FavoriteButton(
              iconSize: 950,
              isFavorite: true,
              // iconDisabledColor: Colors.white,
              valueChanged: (_isFavorite) {
                print('Is Favorite : $_isFavorite');
              },
            ),
            // StarButton(
            //   iconSize: 200,
            //   isStarred: false,
            //   // iconDisabledColor: Colors.white,
            //   valueChanged: (_isStarred) {
            //     print('Is Starred : $_isStarred');
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
