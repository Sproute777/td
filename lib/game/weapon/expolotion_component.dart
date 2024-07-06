import 'package:flame/components.dart';

class ExplosionComponent extends SpriteAnimationComponent with HasGameRef {
  ExplosionComponent({super.position, super.priority})
      : super(
          size: Vector2.all(50),
          anchor: Anchor.center,
          removeOnFinish: true,
        );

  @override
  Future<void> onLoad() async {
    animation = await game.loadSpriteAnimation(
      'weapon/explosion2.png',
      SpriteAnimationData.sequenced(
        stepTime: 0.1,
        amount: 6,
        textureSize: Vector2.all(50),
        loop: false,
      ),
    );
  }
}

class NukeExplosionComponent extends SpriteAnimationComponent with HasGameRef {
  NukeExplosionComponent({super.position, super.priority})
      : super(
          size: Vector2.all(120),
          anchor: Anchor.center,
          removeOnFinish: true,
        );

  @override
  Future<void> onLoad() async {
    animation = await game.loadSpriteAnimation(
      // 960x576 5x3
      'weapon/explosion3.png',
      SpriteAnimationData.sequenced(
        stepTime: 0.5,
        amountPerRow: 5,
        amount: 15,
        textureSize: Vector2(192, 192),
        loop: false,
      ),
    );
  }
}
