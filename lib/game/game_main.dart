import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';

import '../game_controller/game_controller.dart';
import '../game_controller/game_event.dart';
import '../map/map_controller.dart';
import '../ui/inventory/bloc/inventory_bloc.dart';
import 'game_setting.dart';

class GameMain extends FlameGame with TapCallbacks {
  late MapController mapController;
  // final StageBarCubit stageBarBloc;
  final InventoryBloc inventoryBloc;
  // late WeaponFactoryView weaponFactory;
  GameController gameController;
  // late GamebarView gamebarView;
  // bool started = false;

  bool loadDone = false;

  // GameView view = GameView();
  GameSetting setting = GameSetting();
  // GameController controller = GameController();
  // EnemySpawner enemySpawner = EnemySpawner();
  // StatusBar statusBar;
  // GameUtil util;

  GameMain(
      {required this.gameController,
      // required this.stageBarBloc,
      required this.inventoryBloc});

  @override
  void onGameResize(Vector2 size) {
    if (!loadDone) {
      setting.setScreenSize(size);
    }
    super.onGameResize(size);
  }

  int currentTimeMillis() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  @override
  Future<void> onLoad() async {
    final int timeRecord = currentTimeMillis();
    await super.onLoad();

    // await setting.onLoad();
    await setting.neutual.load();

    mapController = MapController(
        tileSize: setting.mapTileSize,
        mapGrid: setting.mapGrid,
        position: setting.mapPosition,
        size: setting.mapSize);
    /*game controller should have same range as map */
    gameController = gameController
      ..position = setting.mapPosition
      ..size = setting.mapSize;

    // gamebarView = GamebarView();
    // weaponFactory = WeaponFactoryView();

    await setting.weapons.load();

    add(mapController);
    add(gameController);
    // add(gamebarView);
    // add(weaponFactory);
    // await add(interface ?? GameInterface());
    setting.enemies.load();

    loadDone = true;
    final int d = currentTimeMillis() - timeRecord;
    debugPrint('GameMain onLoad done takke $d');
    pauseEngine();
  }

  void start() {
    if (loadDone) {
      gameController.send(const GameEvent.enemySpawn());
      // stageBarBloc.add(const SbSetKilled(0));
      // stageBarBloc.add(const SbSetMissed(0));
      // stageBarBloc.add(const SbSetMinerals(400));
    }
  }

  // @Deprecated('Reason')
  // void addMinerals(int value) {
  //   // stageBarBloc.add(SbAddMinerals(value));
  // }
}
