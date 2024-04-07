import 'dart:core';

import 'package:flutter/material.dart';
import 'package:letsgo/dto/params_game.dart';
import 'package:letsgo/enumerations/modality.dart';

class CardMenu extends StatelessWidget {
  const CardMenu({
    required this.title,
    required this.subtitle,
    required this.pathImage,
    required this.modality,
    super.key,
  });

  final String pathImage;
  final String title;
  final String subtitle;
  final Modality modality;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          Navigator.pushNamed(context, "/game",
              arguments: ParamsGame(modality: modality));
        },
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset(
                    pathImage,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                Container(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(height: 5),
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 24,
                        fontFamily: "Vinque",
                      ),
                    ),
                    Container(height: 10),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Colors.black45,
                        fontSize: 18,
                        fontFamily: "Vinque",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
