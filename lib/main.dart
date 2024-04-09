import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:letsgo/components/home.dart';
import 'package:letsgo/components/ranking.dart';
import 'package:letsgo/game/move_game.dart';

void main() {
  runApp(const LetsGoApp());
}

class LetsGoApp extends StatelessWidget {
  const LetsGoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/home",
      routes: {
        "/home": (context) => const Home(),
        "/game": (context) => GameWidget(game: MoveGame(context: context)),
        "/ranking": (context) => const Ranking(),
      },
    );
  }
}
