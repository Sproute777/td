import 'dart:async';
import 'dart:js_interop';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:flame/input.dart';
import 'package:flame/layout.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../game_controller/game_event.dart';
import '../../settings/weapon_settings.dart';
import '../base/game_component.dart';
import '../base/radar.dart';
import '../enemy/enemy_component.dart';
import '../game_main.dart';
import '../util/priority.dart';
import 'cannon.dart';
import 'machine_gun.dart';
import 'missile.dart';
import 'weapon_buttons_component.dart';

class SmartRotateEffect extends RotateEffect {
  final VoidCallback? _onComplete;
  SmartRotateEffect.to(
    double angle,
    EffectController controller,
    void Function()? onComplete,
  )   : _destinationAngle = angle,
        _onComplete = onComplete,
        super.by(0, controller);

  double _angle = 0;
  double _destinationAngle;

  @override
  void onStart() {
    _angle = _destinationAngle - target.angle;
    if (_angle > pi) {
      _angle = _angle - (pi * 2);
    }
    if (_angle < -pi) {
      _angle = _angle + (pi * 2);
    }
  }

  @override
  void onFinish() {
    super.onFinish();
    if (target.angle < 0) {
      target.angle += pi * 2;
    }
    if (target.angle > (pi * 2)) {
      target.angle -= pi * 2;
    }
    _onComplete?.call();
  }

  @override
  void apply(double progress) {
    final dProgress = progress - previousProgress;
    target.angle += _angle * dProgress;
    super.apply(progress);
  }
}

class TurretComponent extends PositionComponent with HasPaint {
  Sprite? sprite;
  TurretComponent({required Vector2 position, required Vector2 size})
      : super(
            position: position,
            size: size,
            priority: Priority.turret,
            anchor: Anchor.center);
  double rotateSpeed = 6.0; /* radians/second */
  double rotateTo(double radians, VoidCallback onComplete) {
    final double duration = (radians - angle).abs() / rotateSpeed;
    if (duration <= 0) {
      onComplete.call();
      return 0;
    }
    add(
      SmartRotateEffect.to(
        radians,
        EffectController(
          duration: duration,
          curve: Curves.easeOut,
          // infinite: false,
        ),
        onComplete,
      ),
    );

    return duration;
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

class WeaponComponent extends PositionComponent
    with
        TapCallbacks,
        Radar<EnemyComponent>,
        HasPaint,
        HasGameRef<GameMain>,
        MixinWeaponButtons {
  late WeaponType weaponType;
  late double range;
  late double fireInterval;
  late TurretComponent turret;
  Sprite? sprite;
  WeaponComponent({
    required Vector2 position,
    required Vector2 size,
    // double life = 100,
  }) : super(
          position: position,
          size: size,
          priority: Priority.weapon,
          anchor: Anchor.topLeft,
        ) {
    turret = TurretComponent(position: size / 2, size: size);
    add(turret);

    onBuilding();
  }

  bool blockMap = false;
  bool blockEnemy = true;
  bool buildDone = false;
  bool active = true;
  bool get buildAllowed => (!blockMap) && (!blockEnemy);

  void fire(Vector2 target) {
    _targetEnemy = target;
    final double radians = position.angleNearTo(target);
    final double rotatePeriod = turret.rotateTo(radians, _fireBullet);
    coolDown(rotatePeriod + fireInterval);
  }

  Vector2? _targetEnemy;

  void _fireBullet() {
    if (_targetEnemy != null) {
      fireBullet(_targetEnemy!);
    }
    _targetEnemy = null;
  }

  void fireBullet(Vector2 target) {}

  void coolDown(double period) {
    radarOn = false;
    add(TimerComponent(
        period: period,
        // repeat: false,
        removeOnFinish: true,
        onTick: () => radarOn = true));
  }

  void onBuilding() {
    buildDone = false;
    radarOn = true;
    radarRange = (size.x + size.y) / 4;
    radarScanAlert = onEnemyBlock;
    radarScanNothing = onEnymyUnBlock;
    radarCollisionDepth = 0;
  }

  void onBuildDone() {
    buildDone = true;
    radarOn = true;
    radarRange = range;
    radarScanAlert = onEnemyAttack;
    radarScanNothing = null;
    radarCollisionDepth = 0;
  }

  void onEnemyBlock(PositionComponent target) {
    blockEnemy = true;
  }

  void onEnymyUnBlock() {
    blockEnemy = false;
  }

  void onEnemyAttack(PositionComponent target) {
    fire(target.position);
  }

  @override
  void render(Canvas canvas) {
    if (!buildDone) {
      final Color? color = buildAllowed ? Colors.green[200] : Colors.red[200];
      /*build indicator */
      canvas.drawRect(size.toRect(), Paint()..color = color!.withOpacity(0.3));
      canvas.drawCircle(
          (size / 2).toOffset(),
          range,
          Paint()
            ..style = PaintingStyle.stroke
            ..color = Colors.green);
    }
    sprite?.render(
      canvas,
      size: size,
      overridePaint: paint,
    );

    super.render(canvas);
  }

  @override
  bool onTapDown(TapDownEvent event) {
    if (!buildDone) {
      if (buildAllowed) {
        gameRef.gameController.send(GameEvent.weaponBuildDone(weapon: this));

        onBuildDone();
      } else {
        gameRef.gameController.send(const GameEvent.weaponBlocked());
      }
    } else {
      if (active) {
        gameRef.gameController.send(GameEvent.weaponShowAction(weapon: this));
      } else {
        return true;
        // gameRef.gameController.send(this, GameEvent.WEAPON_SHOW_PROFILE);
      }
    }

    return false;
  }

  factory WeaponComponent.create(Vector2 anchor, WeaponType weaponType) {
    switch (weaponType) {
      first:
      case WeaponType.cannon:
        return Cannon(position: anchor);
      case WeaponType.mg:
        return MachineGun(position: anchor);
      case WeaponType.missele:
        return Missile(position: anchor);
      case WeaponType.minner:
      case WeaponType.none:
        continue first;
    }
  }
}
