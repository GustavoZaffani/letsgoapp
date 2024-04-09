import 'package:flutter/material.dart';
import 'package:letsgo/components/card_menu.dart';
import 'package:letsgo/enumerations/modality.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
            title: const Text(
              "Olá, jovem padawan!",
              style: TextStyle(
                fontFamily: "Vinque",
              ),
            ),
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
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.deepPurple,
            onPressed: () => Navigator.pushNamed(context, "/ranking"),
            tooltip: 'Ranking',
            child: const Icon(
              Icons.emoji_events_outlined,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
