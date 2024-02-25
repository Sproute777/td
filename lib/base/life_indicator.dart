import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'game_component.dart';

mixin LifeIndicator on GameComponent {
  double maxLife = 0;
  double life = 0;

  void renderLifIndicator(Canvas c) {
    if (maxLife == 0) {
      return;
    }
    final Vector2 start = Vector2.zero();
    final Vector2 mid = Vector2((life / maxLife) * size.x, 0);
    final Vector2 end = Vector2(size.x, 0);
    c.drawLine(start.toOffset(), mid.toOffset(), Paint()..color = Colors.green);
    c.drawLine(mid.toOffset(), end.toOffset(), Paint()..color = Colors.red);
  }
}
