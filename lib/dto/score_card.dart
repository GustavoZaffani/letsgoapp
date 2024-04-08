import 'package:letsgo/enumerations/modality.dart';

class ScoreCard {
  final int position;
  final int time;
  final DateTime dateTimeExercise;
  final Modality modality;

  ScoreCard({
    required this.position,
    required this.time,
    required this.dateTimeExercise,
    required this.modality,
  });
}
