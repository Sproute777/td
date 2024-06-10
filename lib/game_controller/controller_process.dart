part of 'game_controller.dart';

GameSetting gameSetting = GameSetting();

enum GameControl {
  gameStarted,
  gamePaused,
  gameResumed,
  weaponBuilding,
  weaponSelected,
  /*change type */
  weaponBuildDone,
  weaponDestroyed,
  weaponShowAction,
  weaponShowProfile,
  enemySpawn,
  enemyMissed,
  enemyKilled,
  enemyNexWave,
}

class GameInstruction {
  GameControl instruction;
  GameComponent source;

  GameInstruction(this.source, this.instruction);
  void process(GameController controller) {
    switch (instruction) {
      case GameControl.gameStarted:
        // controller.gameRef.started;
        break;
      case GameControl.gameResumed:
        controller.gameRef.resumeEngine();
      case GameControl.gamePaused:
        controller.gameRef.pauseEngine();
      case GameControl.weaponBuilding:
        WeaponViewWidget.hide();
        // controller.gameRef.read<InventoryBloc>().add();
        final WeaponComponent? component = controller.buildWeapon(
            source.position, controller.gameRef.inventoryBloc.state.weapon);
        if (component != null) {
          controller.add(component);
          controller.buildingWeapon?.removeFromParent();
          controller.buildingWeapon = component;
          component.blockMap = component.collision(controller.gateStart) ||
              component.collision(controller.gateEnd) ||
              controller.gameRef.mapController.testBlock(component.position);
        }
      case GameControl.weaponSelected:
        WeaponViewWidget.hide();
        // controller.gameRef.weaponFactory.select(source as SingleWeaponView);
        if (controller.buildingWeapon != null) {
          controller.send(
              controller.buildingWeapon!, GameControl.weaponBuilding);
        }
      case GameControl.weaponBuildDone:
        // controller.buildingWeapon.buildDone = true;
        controller.onBuildDone(source as WeaponComponent);
        controller.gameRef.mapController.addBarrier(source.position);
        controller.buildingWeapon = null;
        controller.processEnemySmartMove();
      case GameControl.weaponDestroyed:
        WeaponViewWidget.hide();
        controller.onDestroy(source as WeaponComponent);
        controller.gameRef.mapController.removeBarrier(source.position);
        controller.processEnemySmartMove();
      case GameControl.enemySpawn:
        controller.enemyFactory.start();
      case GameControl.enemyMissed:
        controller.gameRef.addMissed(1);

      case GameControl.enemyKilled:
        controller.gameRef.addKilled(1);

      case GameControl.enemyNexWave:
        controller.gameRef.setWave(1);

      case GameControl.weaponShowAction:
        WeaponViewWidget.show(source as WeaponComponent);
      default:
    }
  }
}
