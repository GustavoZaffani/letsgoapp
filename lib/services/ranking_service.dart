import 'package:letsgo/dao/shared_preferences.dart';
import 'package:letsgo/dto/score_card.dart';
import 'package:letsgo/dto/score_exercise.dart';
import 'package:letsgo/enumerations/modality.dart';

class RankingService {
  Future<List<ScoreCard>> getGeneralRanking() async {
    SharedPreferencesUtil shared = SharedPreferencesUtil();
    await shared.init();

    List<ScoreExercise> scoreList = shared.getScoreList();
    scoreList.sort((a, b) => b.time.compareTo(a.time));

    int position = 1;

    return scoreList
        .map((score) => ScoreCard(
            position: position++,
            time: score.time,
            dateTimeExercise: score.dateTimeExercise,
            modality: score.modality))
        .toList();
  }

  Future<List<ScoreCard>> getRankingByModality(Modality modality) async {
    SharedPreferencesUtil shared = SharedPreferencesUtil();
    await shared.init();

    List<ScoreExercise> scoreList = shared
        .getScoreList()
        .where((score) => score.modality == modality)
        .toList();

    scoreList.sort((a, b) => b.time.compareTo(a.time));

    int position = 1;

    return scoreList
        .map((score) => ScoreCard(
            position: position++,
            time: score.time,
            dateTimeExercise: score.dateTimeExercise,
            modality: score.modality))
        .toList();
  }
}
