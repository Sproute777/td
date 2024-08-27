import 'package:bonfire/bonfire.dart';
import 'package:flutter/widgets.dart';

/// Functions util to use in your [Enemy]
extension EnemyExtensions on Enemy {
  ///Execute simple attack melee using animation
  void simpleAttackMelee({
    required double damage,
    required Vector2 size,
    int? id,
    int interval = 1000,
    bool withPush = false,
    double? sizePush,
    Direction? direction,
    Future<SpriteAnimation>? animationRight,
    VoidCallback? execute,
    Vector2? centerOffset,
  }) {
    if (!checkInterval('attackMelee', interval, dtUpdate)) return;

    if (isDead) return;

    Direction direct = direction ??
        (gameRef.player != null
            ? getComponentDirectionFromMe(gameRef.player!)
            : lastDirection);

    simpleAttackMeleeByDirection(
      damage: damage,
      direction: direct,
      size: size,
      id: id,
      withPush: withPush,
      sizePush: sizePush,
      animationRight: animationRight,
      attackFrom: AttackOriginEnum.ENEMY,
      centerOffset: centerOffset,
    );

    execute?.call();
  }

  /// Execute the ranged attack using a component with animation
  void simpleAttackRange({
    required Future<SpriteAnimation> animationRight,
    required Future<SpriteAnimation> animationDestroy,
    required Vector2 size,
    Vector2? destroySize,
    int? id,
    double speed = 150,
    double damage = 1,
    Direction? direction,
    int interval = 1000,
    bool withCollision = true,
    ShapeHitbox? collision,
    VoidCallback? onDestroy,
    VoidCallback? execute,
    LightingConfig? lightingConfig,
  }) {
    if (!checkInterval('attackRange', interval, dtUpdate)) return;

    if (isDead) return;

    Direction direct = direction ??
        (gameRef.player != null
            ? getComponentDirectionFromMe(gameRef.player!)
            : lastDirection);

    simpleAttackRangeByDirection(
      animationRight: animationRight,
      animationDestroy: animationDestroy,
      size: size,
      direction: direct,
      id: id,
      speed: speed,
      damage: damage,
      withCollision: withCollision,
      collision: collision,
      onDestroy: onDestroy,
      destroySize: destroySize,
      lightingConfig: lightingConfig,
      attackFrom: AttackOriginEnum.ENEMY,
    );
    execute?.call();
  }

  /// Checks whether the player is within range. If so, move to it.
  /// [visionAngle] in radians
  /// [angle] in radians. is automatically picked up using the component's direction.
  void seeAndMoveToAttackRange({
    Function(Player)? positioned,
    // return true to stop move.
    BoolCallback? notObserved,
    Function(Player)? observed,
    double radiusVision = 32,
    double? visionAngle,
    double? angle,
    double? minDistanceFromPlayer,
    bool useDiagonal = true,
    // bool useDiagonal = true,
  }) {
    if (minDistanceFromPlayer != null) {
      assert(minDistanceFromPlayer < radiusVision);
    }

    if (isDead) return;

    seePlayer(
      radiusVision: radiusVision,
      visionAngle: visionAngle,
      angle: angle,
      observed: (player) {
        observed?.call(player);
        double minD = (minDistanceFromPlayer ?? (radiusVision - 5));
        if (useDiagonal) {
          bool inDistance = keepDistance(
            player,
            minD,
          );
          if (inDistance) {
            final playerDirection = getComponentDirectionFromMe(player);
            lastDirection = playerDirection;
            if (lastDirection == Direction.left ||
                lastDirection == Direction.right) {
              lastDirectionHorizontal = lastDirection;
            }

            if (checkInterval('seeAndMoveToAttackRange', 500, dtUpdate)) {
              stopMove();
            }
            positioned?.call(player);
          }
        } else {
          positionsItselfAndKeepDistance(
            player,
            minDistanceFromPlayer: minD,
            radiusVision: radiusVision,
            positioned: (player) {
              final playerDirection = getComponentDirectionFromMe(player);
              lastDirection = playerDirection;
              if (lastDirection == Direction.left ||
                  lastDirection == Direction.right) {
                lastDirectionHorizontal = lastDirection;
              }

              if (checkInterval('seeAndMoveToAttackRange', 500, dtUpdate)) {
                stopMove();
              }
              positioned?.call(player);
            },
          );
        }
      },
      notObserved: () {
        bool stop = notObserved?.call() ?? true;
        if (stop) {
          stopMove(forceIdle: true);
        }
      },
    );
  }
}
