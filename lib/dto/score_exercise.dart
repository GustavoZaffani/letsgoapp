import 'package:letsgo/enumerations/modality.dart';

class ScoreExercise {
  final int time;
  final DateTime dateTimeExercise;
  final Modality modality;

  ScoreExercise({
    required this.time,
    required this.dateTimeExercise,
    required this.modality,
  });

  factory ScoreExercise.fromJson(Map<String, dynamic> json) {
    return ScoreExercise(
      time: json['time'],
      dateTimeExercise: DateTime.parse(json['dateTimeExercise']),
      modality: (json['modality'] as String).parseModality(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'dateTimeExercise': dateTimeExercise.toIso8601String(),
      'modality': modality.value,
    };
  }
}
