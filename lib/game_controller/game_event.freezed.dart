// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GameEvent {}

/// @nodoc

class _$StartedGEImpl extends StartedGE {
  const _$StartedGEImpl() : super._();

  @override
  String toString() {
    return 'GameEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedGEImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class StartedGE extends GameEvent {
  const factory StartedGE() = _$StartedGEImpl;
  const StartedGE._() : super._();
}

/// @nodoc

class _$PausedGEImpl extends PausedGE {
  const _$PausedGEImpl() : super._();

  @override
  String toString() {
    return 'GameEvent.paused()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PausedGEImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class PausedGE extends GameEvent {
  const factory PausedGE() = _$PausedGEImpl;
  const PausedGE._() : super._();
}

/// @nodoc

class _$ResumedGEImpl extends ResumedGE {
  const _$ResumedGEImpl() : super._();

  @override
  String toString() {
    return 'GameEvent.resumed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResumedGEImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class ResumedGE extends GameEvent {
  const factory ResumedGE() = _$ResumedGEImpl;
  const ResumedGE._() : super._();
}

/// @nodoc

class _$WeaponBuildingGEImpl extends WeaponBuildingGE {
  const _$WeaponBuildingGEImpl({required this.component}) : super._();

  @override
  final GameComponent component;

  @override
  String toString() {
    return 'GameEvent.weaponBuilding(component: $component)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeaponBuildingGEImpl &&
            (identical(other.component, component) ||
                other.component == component));
  }

  @override
  int get hashCode => Object.hash(runtimeType, component);
}

abstract class WeaponBuildingGE extends GameEvent {
  const factory WeaponBuildingGE({required final GameComponent component}) =
      _$WeaponBuildingGEImpl;
  const WeaponBuildingGE._() : super._();

  GameComponent get component;
}

/// @nodoc

class _$WeaponSelectedGEImpl extends WeaponSelectedGE {
  const _$WeaponSelectedGEImpl() : super._();

  @override
  String toString() {
    return 'GameEvent.weaponSelected()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WeaponSelectedGEImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class WeaponSelectedGE extends GameEvent {
  const factory WeaponSelectedGE() = _$WeaponSelectedGEImpl;
  const WeaponSelectedGE._() : super._();
}

/// @nodoc

class _$WeaponBuildDoneGEImpl extends WeaponBuildDoneGE {
  const _$WeaponBuildDoneGEImpl({required this.weapon}) : super._();

  @override
  final WeaponComponent weapon;

  @override
  String toString() {
    return 'GameEvent.weaponBuildDone(weapon: $weapon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeaponBuildDoneGEImpl &&
            (identical(other.weapon, weapon) || other.weapon == weapon));
  }

  @override
  int get hashCode => Object.hash(runtimeType, weapon);
}

abstract class WeaponBuildDoneGE extends GameEvent {
  const factory WeaponBuildDoneGE({required final WeaponComponent weapon}) =
      _$WeaponBuildDoneGEImpl;
  const WeaponBuildDoneGE._() : super._();

  WeaponComponent get weapon;
}

/// @nodoc

class _$WeaponDestroyedGEImpl extends WeaponDestroyedGE {
  const _$WeaponDestroyedGEImpl({required this.weapon}) : super._();

  @override
  final WeaponComponent weapon;

  @override
  String toString() {
    return 'GameEvent.weaponDestroyed(weapon: $weapon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeaponDestroyedGEImpl &&
            (identical(other.weapon, weapon) || other.weapon == weapon));
  }

  @override
  int get hashCode => Object.hash(runtimeType, weapon);
}

abstract class WeaponDestroyedGE extends GameEvent {
  const factory WeaponDestroyedGE({required final WeaponComponent weapon}) =
      _$WeaponDestroyedGEImpl;
  const WeaponDestroyedGE._() : super._();

  WeaponComponent get weapon;
}

/// @nodoc

class _$WeaponBlockedGEImpl extends WeaponBlockedGE {
  const _$WeaponBlockedGEImpl() : super._();

  @override
  String toString() {
    return 'GameEvent.weaponBlocked()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WeaponBlockedGEImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class WeaponBlockedGE extends GameEvent {
  const factory WeaponBlockedGE() = _$WeaponBlockedGEImpl;
  const WeaponBlockedGE._() : super._();
}

/// @nodoc

class _$WeaponShowActionGEImpl extends WeaponShowActionGE {
  const _$WeaponShowActionGEImpl({required this.weapon}) : super._();

  @override
  final WeaponComponent weapon;

  @override
  String toString() {
    return 'GameEvent.weaponShowAction(weapon: $weapon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeaponShowActionGEImpl &&
            (identical(other.weapon, weapon) || other.weapon == weapon));
  }

  @override
  int get hashCode => Object.hash(runtimeType, weapon);
}

abstract class WeaponShowActionGE extends GameEvent {
  const factory WeaponShowActionGE({required final WeaponComponent weapon}) =
      _$WeaponShowActionGEImpl;
  const WeaponShowActionGE._() : super._();

  WeaponComponent get weapon;
}

/// @nodoc

class _$WeaponShowProfileGEImpl extends WeaponShowProfileGE {
  const _$WeaponShowProfileGEImpl() : super._();

  @override
  String toString() {
    return 'GameEvent.weaponShowProfile()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeaponShowProfileGEImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class WeaponShowProfileGE extends GameEvent {
  const factory WeaponShowProfileGE() = _$WeaponShowProfileGEImpl;
  const WeaponShowProfileGE._() : super._();
}

/// @nodoc

class _$EnemySpawnGEImpl extends EnemySpawnGE {
  const _$EnemySpawnGEImpl() : super._();

  @override
  String toString() {
    return 'GameEvent.enemySpawn()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EnemySpawnGEImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class EnemySpawnGE extends GameEvent {
  const factory EnemySpawnGE() = _$EnemySpawnGEImpl;
  const EnemySpawnGE._() : super._();
}

/// @nodoc

class _$EnemyMissedGEImpl extends EnemyMissedGE {
  const _$EnemyMissedGEImpl() : super._();

  @override
  String toString() {
    return 'GameEvent.enemyMissed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EnemyMissedGEImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class EnemyMissedGE extends GameEvent {
  const factory EnemyMissedGE() = _$EnemyMissedGEImpl;
  const EnemyMissedGE._() : super._();
}

/// @nodoc

class _$EnemyKilledGEImpl extends EnemyKilledGE {
  const _$EnemyKilledGEImpl() : super._();

  @override
  String toString() {
    return 'GameEvent.enemyKilled()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EnemyKilledGEImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class EnemyKilledGE extends GameEvent {
  const factory EnemyKilledGE() = _$EnemyKilledGEImpl;
  const EnemyKilledGE._() : super._();
}

/// @nodoc

class _$EnemyNextWaveGEImpl extends EnemyNextWaveGE {
  const _$EnemyNextWaveGEImpl() : super._();

  @override
  String toString() {
    return 'GameEvent.enemyNextWave()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EnemyNextWaveGEImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class EnemyNextWaveGE extends GameEvent {
  const factory EnemyNextWaveGE() = _$EnemyNextWaveGEImpl;
  const EnemyNextWaveGE._() : super._();
}
