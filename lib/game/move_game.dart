import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letsgo/dao/shared_preferences.dart';
import 'package:letsgo/dto/params_athlete.dart';
import 'package:letsgo/dto/params_game.dart';
import 'package:letsgo/dto/score_exercise.dart';
import 'package:letsgo/enumerations/modality.dart';
import 'package:letsgo/game/athlete.dart';
import 'package:letsgo/game/timer_game.dart';

class MoveGame extends FlameGame {
  late Athlete _athlete;
  late TimerGame _text;
  late Modality _modality;

  final BuildContext context;
  final _stopWatch = Stopwatch();
  final _imageNames = [
    ParallaxImageData("backgroundgame.png"),
    ParallaxImageData("tree1.png"),
    ParallaxImageData("tree2.png"),
    ParallaxImageData("tree3.png"),
    ParallaxImageData("tree4.png"),
    ParallaxImageData("floor.png"),
  ];

  MoveGame({required this.context});

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    final ParamsGame? data =
        ModalRoute.of(context)?.settings.arguments as ParamsGame?;

    _modality = data!.modality;

    final parallax = await loadParallaxComponent(_imageNames,
        baseVelocity: getVelocityWorldByModality(_modality),
        velocityMultiplierDelta: Vector2(1.8, 1.0),
        filterQuality: FilterQuality.none);

    _athlete = Athlete(paramsAthlete: createParamsByModality(_modality));
    _text = TimerGame(position: Vector2(size.x / 2, 100), timesInSeconds: 0);

    add(parallax);
    add(_athlete);
    add(_text);

    FlameAudio.bgm.play(getSoundGame(_modality));

    _stopWatch.start();
  }

  @override
  void onRemove() async {
    _stopWatch.stop();
    FlameAudio.bgm.stop();
    saveScore();
    super.onRemove();
  }

  @override
  void update(double dt) {
    super.update(dt);

    _text.timesInSeconds = _stopWatch.elapsed.inSeconds;
  }

  Future<void> saveScore() async {
    ScoreExercise score = ScoreExercise(
      time: _stopWatch.elapsed.inSeconds,
      dateTimeExercise: DateTime.now(),
      modality: _modality,
    );

    SharedPreferencesUtil shared = SharedPreferencesUtil();
    await shared.init();
    shared.saveNewScore(score);
  }

  ParamsAthlete createParamsByModality(Modality? modality) {
    switch (modality) {
      case Modality.run:
        return ParamsAthlete(
          spritePath: "noelrun.png",
          size: Vector2(300, 208),
          amountSprite: 11,
          stepTimeSprite: 0.05,
        );
      case Modality.jump:
        return ParamsAthlete(
          spritePath: "dinojump.png",
          size: Vector2(300, 208),
          amountSprite: 12,
          stepTimeSprite: 0.08,
        );
      case Modality.walk:
        return ParamsAthlete(
          spritePath: "pumpkinheadrun.png",
          size: Vector2(250, 329),
          amountSprite: 10,
          stepTimeSprite: 0.1,
        );
      default:
        throw UnimplementedError('Modality is required!');
    }
  }

  Vector2 getVelocityWorldByModality(Modality? modality) {
    switch (modality) {
      case Modality.run:
        return Vector2(
          50,
          0,
        );
      case Modality.jump:
        return Vector2(
          20,
          0,
        );
      case Modality.walk:
        return Vector2(
          10,
          0,
        );
      default:
        throw UnimplementedError('Modality is required!');
    }
  }

  String getSoundGame(Modality? modality) {
    switch (modality) {
      case Modality.run:
        return "run.wav";
      case Modality.jump:
        return "jump.wav";
      case Modality.walk:
        return "walk.wav";
      default:
        throw UnimplementedError('Modality is required!');
    }
  }
}
