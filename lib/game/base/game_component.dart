import 'dart:math';
import 'dart:ui';

import 'package:flame/components.dart';

import '../game_main.dart';

class GameComponent extends PositionComponent
    with HasGameRef<GameMain>, HasPaint {
  Sprite? sprite;
  SpriteAnimation? animation;
  bool? playing = true;

  GameComponent({
    super.position,
    super.size,
    super.priority,
  }) : super(anchor: Anchor.center);

  bool active = true;
  double get length => (size.x + size.y) / 2;
  double get radius => length / 2;

  @override
  void render(Canvas canvas) {
    sprite?.render(
      canvas,
      size: size,
      overridePaint: paint,
    );
    animation?.frames.forEach((element) {
      element.sprite.render(canvas);
    });

    super.render(canvas);
  }

  double angleNearTo(Vector2 target) {
    final double distance = position.distanceTo(target);
    if (distance == 0) {
      return 0;
    }
    double radians = acos((-target.y + position.y) / distance);
    if (target.x < position.x) {
      radians = pi * 2 - radians;
    }
    return radians;
  }

  Vector2 positionInPrarent(Vector2 point) {
    return point + position;
  }

  Vector2 screenPosition() {
    return gameRef.camera.globalToLocal(
      position,
    );
  }
}
