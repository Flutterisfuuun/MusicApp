import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SocialSignWidgetRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right:10),
          child: Container(
              width: 30,
              height: 30,
              child: CachedNetworkImage(
                  imageUrl:
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/Google_Chrome_icon_%28February_2022%29.svg/1024px-Google_Chrome_icon_%28February_2022%29.svg.png")),
        ),
        Container(
            width: 30,
            height: 30,
            child: CachedNetworkImage(
              imageUrl:
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/Spotify_logo_without_text.svg/2048px-Spotify_logo_without_text.svg.png",
            ),),
      ],
    );
  }
}
