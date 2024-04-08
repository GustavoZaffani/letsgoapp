import 'package:flutter/material.dart';
import 'package:letsgo/dto/score_card.dart';
import 'package:letsgo/enumerations/modality.dart';
import 'package:letsgo/utils/FormatterUtils.dart';

class CardRanking extends StatelessWidget {
  final ScoreCard score;

  CardRanking({
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
            color: retrieveColorByPosition(score.position), width: 4),
      ),
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Posição",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontFamily: "Vinque"),
                      ),
                      Text(
                        score.position.toString(),
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontFamily: "Vinque",
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Modalidade",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Vinque",
                        ),
                      ),
                      Text(
                        score.modality.format,
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontFamily: "Vinque",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Tempo",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Vinque",
                        ),
                      ),
                      Text(
                        formatTimer(score.time),
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontFamily: "Vinque",
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Data/Hora",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Vinque",
                        ),
                      ),
                      Text(
                        formatDateTime(score.dateTimeExercise),
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontFamily: "Vinque",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color retrieveColorByPosition(int position) {
    switch (position) {
      case 1:
        return const Color.fromRGBO(255, 215, 0, 1);
      case 2:
        return const Color.fromRGBO(192, 192, 192, 1);
      case 3:
        return const Color.fromRGBO(205, 127, 50, 1);
      default:
        return Colors.transparent;
    }
  }
}
