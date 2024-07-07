import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import '../base/movable.dart';
import '../base/radar.dart';
import '../enemy/enemy_component.dart';

class BulletComponent extends PositionComponent
    with Movable, Radar<EnemyComponent>, HasPaint {
  // double range = 0;
  Function? onExplosion;
  double damage = 0;
  Sprite? sprite;
  BulletComponent({
    required Vector2 position,
    required Vector2 size,
  }) : super(position: position, size: size, priority: 50);

  @override
  FutureOr<void>? onLoad() {
    radarOn = true;
    radarRange = (size.x + size.y) / 4;
    radarScanAlert = onHitEnemy;
    radarScanNothing = null;
    radarCollisionDepth = 0.2;
    onMoveFinish = outOfRange;
    return super.onLoad();
  }

  @override
  void update(double dt) {
    updateMovable(dt);
    super.update(dt);
  }

  void onHitEnemy(PositionComponent enemy) {
    radarOn = false;
    (enemy as EnemyComponent).receiveDamage(damage);
    removeFromParent();
    onExplosion?.call(enemy);
  }

  void outOfRange() {
    radarOn = false;
    removeFromParent();
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

// class ExplosionComponent extends SpriteAnimationComponent with HasGameRef<GameMain>{
//   ExplosionComponent({
//     required Vector2 position,
//     required Vector2 size,
//   }) : super(position: position, size: size, priority: 55);

//   @override
//   Future<void> onLoad() async {
//     animation = await game.loadSpriteAnimation(
//       'animations/ember.png',
//       SpriteAnimationData.sequenced(
//         amount: 3,
//         textureSize: Vector2.all(16),
//         stepTime: 0.15,
//       ),
//     );
//   }

//   @override
//   set animation(SpriteAnimation? a) {
//     if (a == null) {
//       removeFromParent();
//     }
//     super.animation = a;
//     // animation?.onComplete = this.removeFromParent;
//     removeFromParent();
//     // this.debugMode = true;
//   }
// }
