import 'dart:math';

import 'package:flame/components.dart';
import '../base/game_component.dart';
import '../game/game_setting.dart';
import '../settings/weapon_settings.dart';
import 'bullet_component.dart';
import 'weapon_component.dart';

class Cannon extends WeaponComponent {
  static final WeaponSetting setting =
      GameSetting().weapons.weapon[WeaponType.cannon.index];
  Cannon({
    required super.position,
  }) : super(size: setting.size) {
    size = setting.size;
    weaponType = WeaponType.cannon;
    range = setting.range;
    fireInterval = setting.fireInterval;
    sprite = setting.tower;
    barrel.sprite = setting.barrel[0];
    barrel.size = size;
    barrel.rotateSpeed = setting.rotateSpeed;
  }

  @override
  void fireBullet(Vector2 target) {
    final BulletComponent bullet =
        BulletComponent(position: _bulletPosition(), size: setting.bulletSize)
          ..angle = barrel.angle
          ..damage = setting.damage
          ..sprite = setting.bullet
          ..speed = setting.bulletSpeed
          ..onExplosion = bulletExplosion;
    bullet.moveTo(target);
    parent?.add(bullet);
  }

  Vector2 _bulletPosition() {
    // double bulletR = (setting.bulletSize.x + setting.bulletSize.y) / 4;
    Vector2 localPosition =
        Vector2(radius * sin(barrel.angle), -radius * cos(barrel.angle));
    localPosition += size / 2;
    return positionOf(localPosition);
  }

  void bulletExplosion(GameComponent enemy) {
    enemy.add(ExplosionComponent(
        position: enemy.size / 2, size: setting.explosionSize)
      ..animation = SpriteAnimation.spriteList(setting.explosionSprites,
          stepTime: 0.06, loop: false));
  }
}
