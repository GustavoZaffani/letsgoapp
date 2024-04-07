import 'package:flame/game.dart';

class ParamsAthlete {

  final String spritePath;
  final int amountSprite;
  final double stepTimeSprite;
  final Vector2 size;

  ParamsAthlete({
    required this.spritePath,
    required this.size,
    required this.amountSprite,
    required this.stepTimeSprite,
  });
}
