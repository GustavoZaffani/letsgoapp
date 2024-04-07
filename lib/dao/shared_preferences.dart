import 'dart:convert';

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

  Future<void> saveObjectList<T>(String key, T value) async {
    List<String> jsonList = _preferences.getStringList(key) ?? [];

    String jsonValue = jsonEncode(value);

    jsonList.add(jsonValue);

    await _preferences.setStringList(key, jsonList);
  }

  List<T> getObjectList<T>(String key) {
    List<String> jsonList = _preferences.getStringList(key) ?? [];
    return jsonList.map((json) => jsonDecode(json) as T).toList();
  }
}
