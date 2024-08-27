import 'package:flame/components.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../game/weapon/weapon_component.dart';

part 'game_event.freezed.dart';

@Freezed(
    map: FreezedMapOptions.none, when: FreezedWhenOptions.none, copyWith: false)
sealed class GameEvent with _$GameEvent {
  const GameEvent._();
  const factory GameEvent.started() = StartedGameEvent;
  const factory GameEvent.paused() = PausedGameEvent;
  const factory GameEvent.resumed() = ResumedGameEvent;
  const factory GameEvent.weaponBuilding(
      {required PositionComponent component}) = WeaponBuildingGameEvent;
  const factory GameEvent.weaponSelected() = WeaponSelectedGameEvent;
  const factory GameEvent.weaponUnSelected() = WeaponUnSelectedGameEvent;
  const factory GameEvent.weaponBuildDone({required WeaponComponent weapon}) =
      WeaponBuildDoneGameEvent;
  const factory GameEvent.weaponDestroyed() = WeaponDestroyedGameEvent;
  const factory GameEvent.weaponBlocked() = WeaponBlockedGameEvent;
  const factory GameEvent.weaponShowAction({required WeaponComponent weapon}) =
      WeaponShowActionGameEvent;
  const factory GameEvent.weaponShowProfile() = WeaponShowProfileGameEvent;
  const factory GameEvent.enemySpawn() = EnemySpawnGameEvent;
  const factory GameEvent.enemyMissed() = EnemyMissedGameEvent;
  const factory GameEvent.enemyKilled({required int mineValue}) =
      EnemyKilledGameEvent;
  const factory GameEvent.enemyNextWave() = EnemyNextWaveGameEvent;
}
