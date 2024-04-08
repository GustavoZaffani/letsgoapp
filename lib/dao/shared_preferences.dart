import 'package:letsgo/dto/score_exercise.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil {
  static SharedPreferencesUtil? _instance;
  late SharedPreferences _preferences;

  SharedPreferencesUtil._internal();

  factory SharedPreferencesUtil() {
    _instance ??= SharedPreferencesUtil._internal();
    return _instance!;
  }

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> saveNewScore<T>(ScoreExercise value) async {
    List<String> jsonList = _preferences.getStringList("score") ?? [];

    String jsonValue = value.toJson();

    jsonList.add(jsonValue);

    await _preferences.setStringList("score", jsonList);
  }

  List<ScoreExercise> getScoreList() {
    List<String> jsonList = _preferences.getStringList("score") ?? [];
    return jsonList.map((json) => ScoreExercise.fromJson(json)).toList();
  }
}
