import 'dart:ui';
import 'package:flame/components.dart';

extension SpriteExt on Sprite {
  void renderWithOpacity(
    Canvas canvas,
    Vector2 position,
    Vector2 size, {
    Paint? overridePaint,
    double opacity = 1,
  }) {
    if (paint.color.opacity != opacity) {
      paint.color = paint.color.withOpacity(opacity);
    }
    if (overridePaint != null && overridePaint.color.opacity != opacity) {
      overridePaint.color = overridePaint.color.withOpacity(opacity);
    }
    render(
      canvas,
      position: position,
      size: size,
      overridePaint: overridePaint,
    );
  }
}
