part of 'game_controller.dart';

GameSetting gameSetting = GameSetting();

class GameInstruction {
  GameEvent event;

  GameInstruction(this.event);
  Future<void> process(GameController controller) async {
    switch (event) {
      case StartedGE():
        // controller.gameRef.started;
        break;
      case ResumedGE():
        controller.gameRef.resumeEngine();
      case PausedGE():
        controller.gameRef.pauseEngine();
      case WeaponBuildingGE(:final component):
        debugPrint('WEAPON BUILDING');
        WeaponViewWidget.hide();
        // controller.gameRef.read<InventoryBloc>().add();
        final weapon = WeaponComponent.create(
            component.position, controller.gameRef.inventoryBloc.state.weapon);
        controller.add(weapon);
        controller.buildingWeapon?.removeFromParent();
        controller.buildingWeapon = weapon;
        weapon.blockMap = weapon.collision(controller.gateStart) ||
            weapon.collision(controller.gateEnd) ||
            (await controller.gameRef.mapController
                .isBlockPath(weapon.position));
      case WeaponSelectedGE():
        debugPrint('WEAPON SELECTED');
        WeaponViewWidget.hide();
        // controller.gameRef.weaponFactory.select(source as SingleWeaponView);
        if (controller.buildingWeapon != null) {
          controller.send(
              GameEvent.weaponBuilding(component: controller.buildingWeapon!));
        }
      case WeaponBuildDoneGE(:final weapon):
        debugPrint('WEAPON BUILDING DONE');
        // controller.buildingWeapon.buildDone = true;
        controller.onBuildDone(weapon);
        controller.gameRef.mapController.addBarrier(weapon.position);
        controller.buildingWeapon = null;
        controller.processEnemySmartMove();
      case WeaponBlockedGE():
        debugPrint('WEAPON BLOCKED');
      case WeaponDestroyedGE(:final weapon):
        debugPrint('WEAPON DESTROYED');
        WeaponViewWidget.hide();
        controller.onDestroy(weapon);
        controller.gameRef.mapController.removeBarrier(weapon.position);
        controller.processEnemySmartMove();
      case EnemySpawnGE():
        debugPrint('ENEMY SPAWN');
        controller.enemyFactory.start();
      case EnemyMissedGE():
        controller.repository.incrementMissed();

      case EnemyKilledGE(:final mineValue):
        debugPrint('ENEMY KILLED');
        controller.repository.incrementKilled();
        controller.repository.addMinerals(mineValue);

      case EnemyNextWaveGE():
        debugPrint('ENEMY NEXT WAVE');
        controller.repository.incrementWave();

      case WeaponShowActionGE(:final weapon):
        debugPrint('WEAPON SHOW ACTION');
        WeaponViewWidget.show(weapon);
      default:
    }
  }
}
