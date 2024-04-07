import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:letsgo/components/card_menu.dart';
import 'package:letsgo/enumerations/modality.dart';
import 'package:letsgo/game/move_game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/menu",
      routes: {
        "/menu": (context) => const MyHomePage(title: 'Olá, jovem padawan!'),
        "/game": (context) => GameWidget(game: MoveGame(context: context)),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/background.jpg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              widget.title,
              style: const TextStyle(
                fontFamily: "Vinque",
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.emoji_events),
                tooltip: "Ranking",
              )
            ],
          ),
          body: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CardMenu(
                  title: "Caminhar",
                  subtitle: "Caminhe firme... \nExplore o mundo ao redor!",
                  pathImage: "assets/images/walkbackground.png",
                  modality: Modality.walk,
                ),
                CardMenu(
                  title: "Correr",
                  subtitle: "Corra rápido...\nSeja imparável!",
                  pathImage: "assets/images/runbackground.png",
                  modality: Modality.run,
                ),
                CardMenu(
                  title: "Pular",
                  subtitle: "Pule alto...\nAlcance as estrelas!",
                  pathImage: "assets/images/jumpbackground.png",
                  modality: Modality.jump,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
