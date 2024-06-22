part of 'game_controller.dart';

GameSetting gameSetting = GameSetting();

class GameInstruction {
  GameEvent event;

  GameInstruction(this.event);
  Future<void> process(GameController controller) async {
    switch (event) {
      case StartedGameEvent():
        // controller.gameRef.started;
        break;
      case ResumedGameEvent():
        controller.gameRef.resumeEngine();
      case PausedGameEvent():
        controller.gameRef.pauseEngine();
      case WeaponBuildingGameEvent(:final component):
        debugPrint('WEAPON BUILDING');
        WeaponViewWidget.hide();
        // controller.gameRef.read<InventoryBloc>().add();
        final weapon = WeaponComponent.create(component.position,
            controller.repository.selectedTypeNotifier.value);
        controller.add(weapon);
        controller.buildingWeapon?.removeFromParent();
        controller.buildingWeapon = weapon;
        weapon.blockMap = weapon.collision(controller.gateStart) ||
            weapon.collision(controller.gateEnd) ||
            (await controller.gameRef.mapController
                .isBlockPath(weapon.position));
      case WeaponSelectedGameEvent():
        debugPrint('WEAPON SELECTED');
        WeaponViewWidget.hide();
        // controller.gameRef.weaponFactory.select(source as SingleWeaponView);
        if (controller.buildingWeapon != null) {
          controller.send(
              GameEvent.weaponBuilding(component: controller.buildingWeapon!));
        }
      case WeaponBuildDoneGameEvent(:final weapon):
        debugPrint('WEAPON BUILDING DONE');
        // controller.buildingWeapon.buildDone = true;
        controller.onBuildDone(weapon);
        controller.gameRef.mapController.addBarrier(weapon.position);
        controller.buildingWeapon = null;
        controller.processEnemySmartMove();
      case WeaponBlockedGameEvent():
        debugPrint('WEAPON BLOCKED');
      case WeaponDestroyedGameEvent(:final weapon):
        debugPrint('WEAPON DESTROYED');
        WeaponViewWidget.hide();
        controller.onDestroy(weapon);
        controller.gameRef.mapController.removeBarrier(weapon.position);
        controller.processEnemySmartMove();
      case EnemySpawnGameEvent():
        debugPrint('ENEMY SPAWN');
        controller.enemyFactory.start();
      case EnemyMissedGameEvent():
        controller.repository.incrementMissed();

      case EnemyKilledGameEvent(:final mineValue):
        debugPrint('ENEMY KILLED');
        controller.repository.incrementKilled();
        controller.repository.addMinerals(mineValue);

      case EnemyNextWaveGameEvent():
        debugPrint('ENEMY NEXT WAVE');
        controller.repository.incrementWave();

      case WeaponShowActionGameEvent(:final weapon):
        debugPrint('WEAPON SHOW ACTION');
        WeaponViewWidget.show(weapon);
      default:
    }
  }
}
