import 'dart:ui';

import 'package:flame/components.dart';
import '../base/game_component.dart';
import '../base/radar.dart';
import '../enemy/enemy_component.dart';

enum NeutualType { GATE_START, GATE_END, MINDER, STONE }

class NeutualComponent extends PositionComponent
    with Radar<EnemyComponent>, HasPaint {
  double life = 0;
  late NeutualType neutualType;
  Sprite? sprite;
  NeutualComponent({
    required Vector2 position,
    required Vector2 size,
    required this.neutualType,
  }) : super(position: position, size: size, priority: 20) {
    radarOn = false;

    if (neutualType == NeutualType.GATE_END) {
      radarOn = true;
      radarRange = (size.x + size.y) / 4;
      radarCollisionDepth = 0.9;
      radarScanAlert = (c) => (c as EnemyComponent).onArrived();
    }
  }
  @override
  Future<void>? onLoad() async {
    await super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    sprite?.render(
      canvas,
      size: size,
      overridePaint: paint,
    );

    super.render(canvas);
  }
}
