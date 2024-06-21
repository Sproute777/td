import 'package:freezed_annotation/freezed_annotation.dart';

import '../base/game_component.dart';
import '../weapon/weapon_component.dart';

part 'game_event.freezed.dart';

@Freezed(
    map: FreezedMapOptions.none, when: FreezedWhenOptions.none, copyWith: false)
sealed class GameEvent with _$GameEvent {
  const GameEvent._();
  const factory GameEvent.started() = StartedGE;
  const factory GameEvent.paused() = PausedGE;
  const factory GameEvent.resumed() = ResumedGE;
  const factory GameEvent.weaponBuilding({required GameComponent component}) =
      WeaponBuildingGE;
  const factory GameEvent.weaponSelected() = WeaponSelectedGE;
  const factory GameEvent.weaponBuildDone({required WeaponComponent weapon}) =
      WeaponBuildDoneGE;
  const factory GameEvent.weaponDestroyed({required WeaponComponent weapon}) =
      WeaponDestroyedGE;
  const factory GameEvent.weaponBlocked() = WeaponBlockedGE;
  const factory GameEvent.weaponShowAction({required WeaponComponent weapon}) =
      WeaponShowActionGE;
  const factory GameEvent.weaponShowProfile() = WeaponShowProfileGE;
  const factory GameEvent.enemySpawn() = EnemySpawnGE;
  const factory GameEvent.enemyMissed() = EnemyMissedGE;
  const factory GameEvent.enemyKilled({required int mineValue}) = EnemyKilledGE;
  const factory GameEvent.enemyNextWave() = EnemyNextWaveGE;
}
