import 'dart:math';

import 'package:flame/components.dart';

import '../../settings/weapon_settings.dart';
import '../base/game_component.dart';
import '../game_setting.dart';
import 'bullet_component.dart';
import 'explosion_component.dart';
import 'weapon_component.dart';

class MachineGun extends WeaponComponent {
  static final WeaponSetting setting =
      GameSetting().weapons.weapon[WeaponType.mg.index];
  MachineGun({
    required super.position,
  }) : super(size: setting.size) {
    size = setting.size;
    weaponType = WeaponType.mg;
    range = setting.range;
    fireInterval = setting.fireInterval;
    sprite = setting.tower;
    turret.sprite = setting.barrel[0];
    turret.size = size;
    turret.rotateSpeed = setting.rotateSpeed;
  }

  @override
  void fireBullet(Vector2 target) {
    final BulletComponent bullet =
        BulletComponent(position: _bulletPosition(), size: setting.bulletSize)
          ..angle = turret.angle
          ..damage = setting.damage
          ..sprite = setting.bullet
          ..speed = setting.bulletSpeed
          ..onExplosion = bulletExplosion;
    bullet.moveTo(target);
    parent?.add(bullet);
  }

  Vector2 _bulletPosition() {
    // double bulletR = (setting.bulletSize.x + setting.bulletSize.y) / 4;
    final double r = size.radius /*+ bulletR*/;
    Vector2 localPosition =
        Vector2(r * sin(turret.angle), -r * cos(turret.angle));
    localPosition += size / 2;
    return positionOf(localPosition);
  }

  void bulletExplosion(PositionComponent enemy) {
    enemy.add(
      ExplosionComponent(
        position: enemy.size / 2,
      ),
    );
  }
}
