import 'dart:collection';
import 'dart:math';

import 'package:flame/cache.dart';
import 'package:flame/components.dart';

import '../base/game_component.dart';
import '../base/radar.dart';
import '../base/scanable.dart';
import '../enemy/enemy_component.dart';
import '../enemy/enemy_factory.dart';
import '../game/game_setting.dart';
import '../neutual/neutual_component.dart';
import '../ui/components/weaponview_widget.dart';
import '../ui/inventory/bloc/inventory_bloc.dart';
import '../util/priority_layer.dart';
import '../weapon/cannon.dart';
import '../weapon/machine_gun.dart';
import '../weapon/missile.dart';
import '../weapon/weapon_component.dart';

part 'controller_process.dart';

enum GameStatus { paused, play }

class GameController extends GameComponent {
  WeaponComponent? buildingWeapon;
  EnemyFactory enemyFactory = EnemyFactory();
  GameController({
    super.position,
    super.size,
  }) : super(priority: LayerPriority.getAbovePriority(1)) {
    add(enemyFactory);
  }

  GameStatus _gameStatus = GameStatus.paused;
  GameStatus get gameStatus => _gameStatus;
  void newGameStatus(GameStatus gameStatus) => _gameStatus = gameStatus;

  @override
  void update(double dt) {
    processInstruction();
    processRadarScan();
    super.update(dt);
  }

  /* Instruction Queue*/
  // ignore: prefer_final_fields
  Queue _instructQ = Queue<GameInstruction>();
  void send(GameComponent source, GameControl instruct) {
    _instructQ.add(GameInstruction(source, instruct));
  }

  void processInstruction() {
    while (_instructQ.isNotEmpty) {
      final GameInstruction instruct = _instructQ.removeFirst();
      instruct.process(this);
    }
  }

  /* Process Routine */
  void processRadarScan() {
    final Iterable<Component> radars =
        children.where((e) => e is Radar && e.radarOn).cast();
    final Iterable<Component> scanbles =
        children.where((e) => e is Scanable && e.scanable).cast();

    for (final element in radars) {
      (element as Radar).radarScan(scanbles);
    }
  }

  void processEnemySmartMove() {
    final Iterable<Component> enemies =
        children.where((e) => e is EnemyComponent && e.active).cast();
    for (final element in enemies) {
      (element as EnemyComponent).moveSmart(gateEnd.position);
    }
  }

  /* Load Initialization */
  late NeutualComponent gateStart;
  late NeutualComponent gateEnd;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    loadGate();
  }

  Future<void> loadGate() async {
    /*random gate */
    final double rndx = Random().nextDouble();
    final double rndy = Random().nextDouble();
    Vector2 start, end;

    if (rndx < rndy) {
      start = Vector2(0,
          (Random().nextDouble() * gameSetting.mapGrid.y).toInt().toDouble());
      end = Vector2(gameSetting.mapGrid.x - 1,
          (Random().nextDouble() * gameSetting.mapGrid.y).toInt().toDouble());
    } else {
      start = Vector2(
          (Random().nextDouble() * gameSetting.mapGrid.x).toInt().toDouble(),
          0);
      end = Vector2(
          (Random().nextDouble() * gameSetting.mapGrid.x).toInt().toDouble(),
          gameSetting.mapGrid.y - 1);
    }
    start = gameSetting.dotMultiple(start, gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);
    end = gameSetting.dotMultiple(end, gameSetting.mapTileSize) +
        (gameSetting.mapTileSize / 2);

    final images = Images();
    gateStart = NeutualComponent(
        position: start,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_START)
      ..sprite = Sprite(await images.load('blackhole.png'));
    gateEnd = NeutualComponent(
        position: end,
        size: gameSetting.mapTileSize,
        neutualType: NeutualType.GATE_END)
      ..sprite = Sprite(await images.load('whitehole.png'));
    add(gateStart);
    add(gateEnd);
  }

  WeaponComponent? buildWeapon(Vector2 anchor, WeaponType weaponType) {
    late WeaponComponent? weapon;
    switch (weaponType) {
      case WeaponType.cannon:
        weapon = Cannon(position: anchor);
      case WeaponType.mg:
        weapon = MachineGun(position: anchor);
      case WeaponType.missele:
        weapon = Missile(position: anchor);
      default:
        break;
    }
    return weapon;
  }

  void onBuildDone(WeaponComponent c) {
    gameRef.inventoryBloc.add(InvAddCost(index: c.weaponType.index));
    gameRef.subsractMinerals(c.weaponType.index);
  }

  void onDestroy(WeaponComponent c) {
    gameRef.inventoryBloc.add(InvSubstractCost(index: c.weaponType.index));
  }

  void showWeaponDialog() {}
}
