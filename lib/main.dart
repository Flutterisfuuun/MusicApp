import 'package:flutter/material.dart';
import 'package:my_app/music_app/bottom_nav_bar.dart';

import 'package:flame_splash_screen/flame_splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter(); // init flutter hive
  runApp(MyApp());
}

final themeMode = ValueNotifier(2);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreenGame(),
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class OtherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('Come again'),
          onPressed: () {
            Navigator.push<void>(
              context,
              MaterialPageRoute(builder: (context) => SplashScreenGame()),
            );
          },
        ),
      ),
    );
  }
}

class SplashScreenGame extends StatefulWidget {
  @override
  _SplashScreenGameState createState() => _SplashScreenGameState();
}

class _SplashScreenGameState extends State<SplashScreenGame> {
  FlameSplashController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlameSplashScreen(
        showBefore: (BuildContext context) {
          return const Text("Don't worry");
        },
        showAfter: (BuildContext context) {
          return const Text('Be Happy');
        },
        theme: FlameSplashTheme.dark,
        onFinish: (context) => Navigator.pushReplacement<void, void>(
          context,
          MaterialPageRoute(builder: (context) => Bottom_Nav_Bar()),
        ),
      ),
    );
  }
}
