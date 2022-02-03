import 'dart:collection';
import 'dart:math';
import 'package:flame/assets.dart';
import 'package:flame/components.dart';
import 'package:td/base/game_component.dart';
import 'package:td/base/radar.dart';
import 'package:td/base/scanable.dart';
import 'package:td/game_blocs/components/weaponview_widget.dart';
import 'package:td/game_blocs/inventory/bloc/inventory_bloc.dart';
import 'package:td/game_blocs/stage_bar/bloc/stage_bar_bloc.dart';
import 'package:td/enemy/enemy_component.dart';
import 'package:td/enemy/enemy_factory.dart';
import 'package:td/game/game_setting.dart';
import 'package:td/neutual/neutual_component.dart';
import 'package:td/util/priority_layer.dart';
import 'package:td/weapon/cannon.dart';
import 'package:td/weapon/machine_gun.dart';
import 'package:td/weapon/missile.dart';
import 'package:td/weapon/weapon_component.dart';

part 'controller_process.dart';

class GameController extends GameComponent {
  WeaponComponent? buildingWeapon;
  EnemyFactory enemyFactory = EnemyFactory();
  GameController({
    position,
    size,
  }) : super(
            position: position,
            size: size,
            priority: LayerPriority.getAbovePriority(1)) {
    add(enemyFactory);
  }

  @override
  void update(double dt) {
    processInstruction();
    processRadarScan();
    super.update(dt);
  }

  /* Instruction Queue*/
  // ignore: prefer_final_fields
  Queue _instructQ = Queue<GameInstruction>();
  send(GameComponent source, GameControl _instruct) {
    _instructQ.add(GameInstruction(source, _instruct));
  }

  void processInstruction() {
    while (_instructQ.isNotEmpty) {
      GameInstruction _instruct = _instructQ.removeFirst();
      _instruct.process(this);
    }
  }

  /* Process Routine */
  void processRadarScan() {
    Iterable<Component> radars =
        children.where((e) => e is Radar && e.radarOn).cast();
    Iterable<Component> scanbles =
        children.where((e) => e is Scanable && e.scanable).cast();

    radars.forEach((element) {
      (element as Radar).radarScan(scanbles);
    });
  }

  void processEnemySmartMove() {
    Iterable<Component> enemies =
        children.where((e) => e is EnemyComponent && e.active).cast();
    enemies.forEach((element) {
      (element as EnemyComponent).moveSmart(gateEnd.position);
    });
  }

  /* Load Initialization */
  late NeutualComponent gateStart;
  late NeutualComponent gateEnd;
  @override
  Future<void>? onLoad() {
    super.onLoad();
    loadGate();
  }

  void loadGate() async {
    /*random gate */
    double rndx = Random().nextDouble();
    double rndy = Random().nextDouble();
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
        break;
      case WeaponType.mg:
        weapon = MachineGun(position: anchor);
        break;
      case WeaponType.missele:
        weapon = Missile(position: anchor);
        break;
      default:
        break;
    }
    return weapon;
  }

  void onBuildDone(WeaponComponent c) {
    gameRef.read<InventoryBloc>().add(InvAddCost(index: c.weaponType.index));
    gameRef.read<StageBarBloc>().add(SbSubtractMinerals(c.weaponType.index));
  }

  void onDestroy(WeaponComponent c) {
    gameRef
        .read<InventoryBloc>()
        .add(InvSubstractCost(index: c.weaponType.index));
  }

  void showWeaponDialog() {}
}
