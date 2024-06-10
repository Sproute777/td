import 'dart:math';

import 'package:flame/components.dart';
import 'package:flutter/foundation.dart';

import '../base/game_component.dart';
import '../base/life_indicator.dart';
import '../base/movable.dart';
import '../base/scanable.dart';
import '../game_controller/game_controller.dart';

enum EnemyType { enemyA, enemyB, enemyC, enemyD }

class EnemyComponent extends GameComponent
    with Scanable, Movable, EnemySmartMove, LifeIndicator {
  double _maxLife = 0;
  double life = 0;
  int mineValue = 5;
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
    renderLifIndicator(canvas);
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
      gameRef.gameController.send(this, GameControl.enemyMissed);
      removeFromParent();
    }
  }

  void onKilled() {
    active = false;
    gameRef.gameController.send(this, GameControl.enemyKilled);
    gameRef.addMinerals(mineValue);
    // gameRef.gamebarView.mineCollected += mineValue;
    removeFromParent();
  }
}

mixin EnemySmartMove on GameComponent {
  /*Enemy move path controller */
  final path = <Point<int>>[];
  void moveSmart(Vector2 to) {
    path.clear();
    path.addAll(gameRef.mapController.findPath(position, to));
    debugPrint('PATH ${path.length}');
    if (path.isNotEmpty) {
      pathNextMove();
    }
  }

  void pathNextMove() {
    final next = path.removeAt(0);
    (this as Movable).moveTo(moveRadomPosition(next), pathNextMove);
  }

  Vector2 moveRadomPosition(Point<int> node) {
    // if (node.next == null) {
    //   /*target goto center*/
    //   Vector2 lefttop = gameRef.mapController.nodeToPosition(node);
    //   return lefttop + (gameRef.mapController.tileSize / 2);
    // } else {

    Vector2 lefttop = gameRef.mapController.nodeToPosition(node);
    final randomArea = Vector2(gameRef.mapController.tileSize.x - size.x,
        gameRef.mapController.tileSize.y - size.y);
    lefttop = lefttop + Vector2(size.x / 2, size.y / 2);
    final rndx = Random().nextDouble();
    final rndy = Random().nextDouble();
    return lefttop + Vector2(randomArea.x * rndx, randomArea.y * rndy);
    // }
  }
}
