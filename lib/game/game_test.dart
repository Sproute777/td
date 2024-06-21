import 'package:flutter/cupertino.dart';

import '../base/game_component.dart';
import '../base/radar.dart';
import '../base/scanable.dart';
import '../enemy/enemy_component.dart';
import '../weapon/bullet_component.dart';
import '../weapon/cannon.dart';
import '../weapon/weapon_component.dart';
import 'game_main.dart';

class GameTest extends GameMain with GameDebug {
  GameTest(
      {required super.gameController,
      // required super.stageBarBloc,
      required super.inventoryBloc});

  @override
  Future<void> onLoad() async {
    // recordTime();
    await super.onLoad();

    // timeDelay("Game onLoad ");
  }

  @override
  void update(double t) {
    recordTime();
    super.update(t);
    timeDelay('Game update ');
    // if (loadDone) listComponents();
  }

  @override
  void render(canvas) {
    recordTime();
    super.render(canvas);
    timeDelay('Game render ');
  }

  // void debug(double t) {
  //   if (debug) {
  //     // double _fps = Flame.device.fps();
  //     // print('GameMain FPS $_fps');
  //     Iterable<Component> components = gameController.children;

  //     var total = components.length;
  //     var radars = components.where((element) => element is Radar).length;
  //     var tiles = components.where((element) => element is MapTileComponent);
  //     var cannons = components.where((element) => element is Cannon).length;

  //     // print('total components $total, radars $radars, tiles $tiles, cannons $cannons, enemies $enemies, sensors $sensors, bullets $bullets');
  //   }
  // }
}

mixin GameDebug on GameMain {
  bool debug = false;
  @override
  int currentTimeMillis() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  int timeRecord = 0;
  void recordTime() {
    if (debug) {
      timeRecord = currentTimeMillis();
      // print('start timeRecord at $timeRecord');
    }
  }

  void timeDelay(String m) {
    if (debug) {
      if (timeRecord > 0) {
        final int d = currentTimeMillis() - timeRecord;
        debugPrint('$m takes $d');
        timeRecord = 0;
      }
    }
  }

  @override
  void update(double t) {
    if (t < 1) {
      super.update(t);
    }
  }

  void listComponents() {
    if (!debug) {
      return;
    }

    int weapon = 0, enemy = 0, cannon = 0, bullet = 0, exp = 0;
    int radar = 0, scanable = 0;
    final GameComponent c = gameController;
    // gameController;

    void count(c) {
      if (c is WeaponComponent) {
        weapon++;
      }
      if (c is EnemyComponent) {
        enemy++;
      }
      if (c is Cannon) {
        cannon++;
      }
      if (c is BulletComponent) {
        bullet++;
      }
      if (c is ExplosionComponent) {
        exp++;
      }
      if (c is Radar) {
        radar++;
      }
      if (c is Scanable) {
        scanable++;
      }
    }

    void loopChildren(c) {
      count(c);
      if (c.children.length > 0) {
        c.children.forEach((e) => loopChildren(e));
      }
    }

    loopChildren(c);

    debugPrint(
        'weapon $weapon, enemy $enemy, cannon $cannon, bullet $bullet, exp $exp, radar $radar, scanable $scanable');
  }
}
