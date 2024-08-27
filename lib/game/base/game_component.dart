import 'dart:math';

import 'package:flame/components.dart';

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

  Vector2 positionInParent(Vector2 point) {
    return point + this;
  }

  double get radius => (x + y) / 2 / 2;
}
