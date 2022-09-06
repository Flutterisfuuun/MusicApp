import 'package:flutter/material.dart';

class listofMusic {
  final String name;
  final String singer;
  final String image;
  final int duration;
  final String url;

  listofMusic({
    required this.name,
    required this.singer,
    required this.image,
    required this.duration,
    required this.url,
  });
}

List<listofMusic> enjoySong = [
  listofMusic(
    name: "Патрон",
    image: "https://soundtimes.ru/images/pesni5/361.jpg",
    singer: "Трек - Miyagi & Andy Panda",
    duration: 300,
    url: "https://mp3uk.net/mp3/files/miyagi-andy-panda-patron-mp3.mp3",
  ),
  listofMusic(
    name: "Yamakasi",
    image:
        "https://static.wixstatic.com/media/409f61_1fbffabc5c9d452ea3a4438b533f1fb8~mv2.jpg/v1/fill/w_617,h_800,al_c,q_85/MIYAGI%20%26%20ANDY%20PANDA%20%E2%80%93%20YAMAKASI.jpg",
    singer: "Miyagi & Andy Panda",
    duration: 300,
    url:
        "https://mp3uk.net/mp3/files/miyagi-andy-panda-yamakasi-novyj-albom-mp3.mp3",
  ),
  listofMusic(
    name: "Touch the Sky",
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSb8IuURIImvPh-OjHy1Yu2HF63X5-wAvO7KL8eYC8Njwyfd_gTUEkVG2w3QAgANrHcR6E&usqp=CAU",
    singer: "Charlie Cardin",
    duration: 300,
    url: "https://mp3uk.net/mp3/files/ollane-miyagi-touch-the-sky-mp3.mp3",
  ),
  listofMusic(
    name: "Там ревели горы",
    image: "https://muzyka.ws/uploads/posts/2020-07/5f1345c86e9a5.jpg",
    singer: "Ollane, Miyagi",
    duration: 300,
    url:
        "https://mp3uk.net/mp3/files/miyagi-andy-panda-tam-reveli-gory-mp3.mp3",
  ),
  listofMusic(
    name: "Minor",
    image:
        "https://teleprogramma.pro/sites/default/files/nodes/node_1374415_1653642838.jpg",
    singer: "Miyagi, Andy Panda",
    duration: 300,
    url: "https://mp3uk.net/mp3/files/miyagi-andy-panda-minor-mp3.mp3",
  ),
  listofMusic(
    name: "Небо",
    image: "https://lmusic.kz/images/cover/miyagi-nebo.jpeg",
    singer: "Miyagi",
    duration: 300,
    url: "https://mp3uk.net/mp3/files/miyagi-nebo-mp3.mp3",
  ),
  listofMusic(
    name: "Listen To Your Heart",
    image:
        "https://is1-ssl.mzstatic.com/image/thumb/Music116/v4/dd/36/52/dd3652f4-d349-8ec7-48d5-3c8af521bc70/cover.jpg/375x375bb.jpg",
    singer: "Miyagi, Эндшпиль",
    duration: 300,
    url:
        "https://mp3uk.net/mp3/files/miyagi-endshpil-listen-to-your-heart-mp3.mp3",
  ),
  listofMusic(
    name: "По Душам",
    image:
        "https://muzictext.ru/wp-content/uploads/2022/05/mot-po-dusham-tekst.jpg",
    singer: "Мот",
    duration: 300,
    url: "https://mp3uk.net/mp3/files/mot-po-dusham-mp3.mp3",
  ),
  listofMusic(
    name: "Like it doesn't hurt",
    image:
        "https://muzfan.net/uploads/posts/2020-08/1598525825_feat_-alena-omargalieva-ya-podnimayus-nad-zemlei.jpg",
    singer: "Баста, Алёна Омаргалиева",
    duration: 300,
    url:
        "https://mp3uk.net/mp3/files/basta-alyona-omargalieva-ya-podnimayus-nad-zemlej-mp3.mp3",
  ),
  listofMusic(
    name: "Осень",
    image:
        "https://images.genius.com/2f96aa3034037ab4ffd69af2fb499211.1000x1000x1.jpg",
    singer: "Баста, Andro",
    duration: 300,
    url: "https://mp3uk.net/mp3/files/basta-andro-osen-mp3.mp3",
  ),
  listofMusic(
    name: "Живу как хочу",
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9J9nvzZXkoQNGMe6-x_BDkfi0WvoZfumJHeVTuGS27EgOnXu5mKfbZ8GZQHqYimp2xcs&usqp=CAU",
    singer: "Слава",
    duration: 300,
    url: "https://mp3uk.net/mp3/files/slava-zhivu-kak-hochu-mp3.mp3",
  ),
  listofMusic(
    name: "Не Жаль",
    image:
        "https://www.chitalnya.ru/upload/203/9b9da856634b11b42ca0b075ac8eb2ee.jpg",
    singer: "104, Miyagi, Скриптонит",
    duration: 300,
    url: "https://mp3uk.net/mp3/files/104-miyagi-skriptonit-ne-zhal-mp3.mp3",
  ),
];
