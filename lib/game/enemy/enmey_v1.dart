import 'dart:math';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import '../game_setting.dart';
import 'enemy_component.dart';

GameSetting setting = GameSetting();

class EnemyV1 extends EnemyComponent with HasPaint {
  late final SpriteSheet spriteSheet;
  EnemyV1({required super.position, required EnemyType type})
      : super(size: Vector2.zero()) {
    enemyType = type;
    final EnemySetting s = setting.enemies.enemy[enemyType.index];
    maxLife = s.life;
    speed = s.speed;
    size = setting.enemySize * s.scale;
    spriteSheet = s.spriteSheet;
  }
  SpriteAnimation? animation;
  double initAngle = pi / 2;

  @override
  set angle(double a) {
    super.angle = a - initAngle;
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();
    setLiveAnimation();
  }

  @override
  void onKilled() {
    setDeadAnimation();
    super.onKilled();
  }

  void setLiveAnimation() {
    final List<Sprite> sprites = [];
    sprites.add(spriteSheet.getSprite(0, 0));
    sprites.add(spriteSheet.getSprite(0, 1));
    animation = SpriteAnimation.spriteList(sprites, stepTime: 0.4);
  }

  void setDeadAnimation() {
    final List<Sprite> sprites = [];
    sprites.add(spriteSheet.getSprite(0, 0));
    sprites.add(spriteSheet.getSprite(1, 0));
    sprites.add(spriteSheet.getSprite(2, 0));
    animation = SpriteAnimation.spriteList(sprites, stepTime: 0.1, loop: false);
  }

  @override
  void render(Canvas canvas) {
    animation?.frames.forEach((element) {
      element.sprite.render(canvas);
    });

    super.render(canvas);
  }
}
