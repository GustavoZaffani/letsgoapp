import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flame/text.dart';
import 'package:letsgo/utils/FormatterUtils.dart';

class TimerGame extends TextComponent {
  int timesInSeconds;

  TimerGame({required Vector2 position, required this.timesInSeconds})
      : super(
            text: formatTimer(timesInSeconds),
            anchor: Anchor.topCenter,
            position: position,
            textRenderer: TextPaint(
                style: TextStyle(
              fontSize: 36.0,
              color: BasicPalette.white.color,
                  fontFamily: "Vinque"
            )));

  @override
  void update(double dt) {
    super.update(dt);
    text = formatTimer(timesInSeconds);
  }
}
