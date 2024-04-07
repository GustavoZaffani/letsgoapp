import 'package:flame/components.dart';
import 'package:letsgo/dto/params_athlete.dart';
import 'package:letsgo/game/move_game.dart';

class Athlete extends SpriteAnimationComponent with HasGameRef<MoveGame> {
  final ParamsAthlete paramsAthlete;

  Athlete({
    required this.paramsAthlete,
  }) : super(size: paramsAthlete.size, anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    animation = await game.loadSpriteAnimation(
      paramsAthlete.spritePath,
      SpriteAnimationData.sequenced(
        amount: paramsAthlete.amountSprite,
        stepTime: paramsAthlete.stepTimeSprite,
        textureSize: paramsAthlete.size,
      ),
    );

    position = Vector2(
      game.size.x / 2,
      game.size.y - (paramsAthlete.size.y / 2) - 50,
    );
  }
}
