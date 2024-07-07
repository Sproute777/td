import 'dart:math';

import 'package:flame/components.dart';

import '../base/game_component.dart';
import '../base/life_indicator.dart';
import '../base/movable.dart';
import '../base/scanable.dart';
import '../../game_controller/game_event.dart';
import '../game_main.dart';

enum EnemyType { enemyA, enemyB, enemyC, enemyD }

class EnemyComponent extends PositionComponent
    with Scanable, Movable, LifeIndicator, HasGameRef<GameMain> {
  double _maxLife = 0;
  double life = 0;
  int mineValue = 5;
  bool active = true;
  bool dead = false;
  late EnemyType enemyType;
  EnemyComponent({
    required Vector2 position,
    required Vector2 size,
  }) : super(position: position, size: size, priority: 30);

  @override
  double get maxLife => _maxLife;
  @override
  set maxLife(double m) {
    _maxLife = m;
    life = m;
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (life < 0) {
      if (!dead) {
        onKilled();
      }
      dead = true;
      active = false;
    }

    if (active) {
      updateMovable(dt);
    }
  }

  @override
  void render(canvas) {
    super.render(canvas);
    renderLifIndicator(canvas, size);
  }

  final path = <Point<int>>[];
  Future<void> moveSmart(Vector2 from, Vector2 to) async {
    final p = await gameRef.mapController.findPath(from, to);
    path.clear();
    path.addAll(p);
    pathNextMove();
  }

  void pathNextMove() {
    if (path.isNotEmpty) {
      final next = path.removeLast();
      (this as Movable).moveTo(moveRadomPosition(next), pathNextMove);
    }
  }

  Vector2 moveRadomPosition(Point<int> node) {
    final Vector2 mapPoint = gameRef.mapController.nodeToPosition(node);
    return mapPoint + (gameRef.mapController.tileSize / 2);
  }

  @override
  void onRemove() {
    path.clear();
    super.onRemove();
  }

  void receiveDamage(double damage) {
    life -= damage;
  }

  void onArrived() {
    if (!dead) {
      active = false;
      gameRef.gameController.send(const GameEvent.enemyMissed());
      removeFromParent();
    }
  }

  void onKilled() {
    active = false;
    gameRef.gameController.send(GameEvent.enemyKilled(mineValue: mineValue));
    removeFromParent();
  }
}

mixin EnemySmartMove on HasGameRef<GameMain> {
  /*Enemy move path controller */
}
