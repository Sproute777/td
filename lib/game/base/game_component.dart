import 'dart:math';

import 'package:flame/components.dart';

import '../game_main.dart';

// class GameComponent extends PositionComponent with HasGameRef<GameMain> {
//   GameComponent({
//     super.position,
//     super.size,
//     super.priority,
//   }) : super(anchor: Anchor.center);

//   // Vector2 screenPosition() {
//   //   return gameRef.camera.globalToLocal(
//   //     position,
//   //   );
//   // }
// }

extension ExtVector2 on Vector2 {
  double angleNearTo(Vector2 target) {
    final double distance = distanceTo(target);
    if (distance == 0) {
      return 0;
    }
    double radians = acos((-target.y + y) / distance);
    if (target.x < x) {
      radians = pi * 2 - radians;
    }
    return radians;
  }

  Vector2 positionInPrarent(Vector2 point) {
    return point + this;
  }

  double get radius => (x + y) / 2 / 2;
}
