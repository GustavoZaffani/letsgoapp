import 'dart:convert';

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

  factory ScoreExercise.fromMap(Map<String, dynamic> json) {
    return ScoreExercise(
      time: int.parse(json["time"]),
      dateTimeExercise: DateTime.parse(json['dateTimeExercise'].toString()),
      modality: (json['modality'] as String).parseModality(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'time': time.toString(),
      'dateTimeExercise': dateTimeExercise.toIso8601String(),
      'modality': modality.value,
    };
  }

  String toJson() => json.encode(toMap());

  factory ScoreExercise.fromJson(String source) =>
      ScoreExercise.fromMap(json.decode(source));
}
