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

class _$StartedGameEventImpl extends StartedGameEvent {
  const _$StartedGameEventImpl() : super._();

  @override
  String toString() {
    return 'GameEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedGameEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class StartedGameEvent extends GameEvent {
  const factory StartedGameEvent() = _$StartedGameEventImpl;
  const StartedGameEvent._() : super._();
}

/// @nodoc

class _$PausedGameEventImpl extends PausedGameEvent {
  const _$PausedGameEventImpl() : super._();

  @override
  String toString() {
    return 'GameEvent.paused()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PausedGameEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class PausedGameEvent extends GameEvent {
  const factory PausedGameEvent() = _$PausedGameEventImpl;
  const PausedGameEvent._() : super._();
}

/// @nodoc

class _$ResumedGameEventImpl extends ResumedGameEvent {
  const _$ResumedGameEventImpl() : super._();

  @override
  String toString() {
    return 'GameEvent.resumed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResumedGameEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class ResumedGameEvent extends GameEvent {
  const factory ResumedGameEvent() = _$ResumedGameEventImpl;
  const ResumedGameEvent._() : super._();
}

/// @nodoc

class _$WeaponBuildingGameEventImpl extends WeaponBuildingGameEvent {
  const _$WeaponBuildingGameEventImpl({required this.component}) : super._();

  @override
  final PositionComponent component;

  @override
  String toString() {
    return 'GameEvent.weaponBuilding(component: $component)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeaponBuildingGameEventImpl &&
            (identical(other.component, component) ||
                other.component == component));
  }

  @override
  int get hashCode => Object.hash(runtimeType, component);
}

abstract class WeaponBuildingGameEvent extends GameEvent {
  const factory WeaponBuildingGameEvent(
          {required final PositionComponent component}) =
      _$WeaponBuildingGameEventImpl;
  const WeaponBuildingGameEvent._() : super._();

  PositionComponent get component;
}

/// @nodoc

class _$WeaponSelectedGameEventImpl extends WeaponSelectedGameEvent {
  const _$WeaponSelectedGameEventImpl() : super._();

  @override
  String toString() {
    return 'GameEvent.weaponSelected()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeaponSelectedGameEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class WeaponSelectedGameEvent extends GameEvent {
  const factory WeaponSelectedGameEvent() = _$WeaponSelectedGameEventImpl;
  const WeaponSelectedGameEvent._() : super._();
}

/// @nodoc

class _$WeaponUnSelectedGameEventImpl extends WeaponUnSelectedGameEvent {
  const _$WeaponUnSelectedGameEventImpl() : super._();

  @override
  String toString() {
    return 'GameEvent.weaponUnSelected()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeaponUnSelectedGameEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class WeaponUnSelectedGameEvent extends GameEvent {
  const factory WeaponUnSelectedGameEvent() = _$WeaponUnSelectedGameEventImpl;
  const WeaponUnSelectedGameEvent._() : super._();
}

/// @nodoc

class _$WeaponBuildDoneGameEventImpl extends WeaponBuildDoneGameEvent {
  const _$WeaponBuildDoneGameEventImpl({required this.weapon}) : super._();

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
            other is _$WeaponBuildDoneGameEventImpl &&
            (identical(other.weapon, weapon) || other.weapon == weapon));
  }

  @override
  int get hashCode => Object.hash(runtimeType, weapon);
}

abstract class WeaponBuildDoneGameEvent extends GameEvent {
  const factory WeaponBuildDoneGameEvent(
      {required final WeaponComponent weapon}) = _$WeaponBuildDoneGameEventImpl;
  const WeaponBuildDoneGameEvent._() : super._();

  WeaponComponent get weapon;
}

/// @nodoc

class _$WeaponDestroyedGameEventImpl extends WeaponDestroyedGameEvent {
  const _$WeaponDestroyedGameEventImpl() : super._();

  @override
  String toString() {
    return 'GameEvent.weaponDestroyed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeaponDestroyedGameEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class WeaponDestroyedGameEvent extends GameEvent {
  const factory WeaponDestroyedGameEvent() = _$WeaponDestroyedGameEventImpl;
  const WeaponDestroyedGameEvent._() : super._();
}

/// @nodoc

class _$WeaponBlockedGameEventImpl extends WeaponBlockedGameEvent {
  const _$WeaponBlockedGameEventImpl() : super._();

  @override
  String toString() {
    return 'GameEvent.weaponBlocked()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeaponBlockedGameEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class WeaponBlockedGameEvent extends GameEvent {
  const factory WeaponBlockedGameEvent() = _$WeaponBlockedGameEventImpl;
  const WeaponBlockedGameEvent._() : super._();
}

/// @nodoc

class _$WeaponShowActionGameEventImpl extends WeaponShowActionGameEvent {
  const _$WeaponShowActionGameEventImpl({required this.weapon}) : super._();

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
            other is _$WeaponShowActionGameEventImpl &&
            (identical(other.weapon, weapon) || other.weapon == weapon));
  }

  @override
  int get hashCode => Object.hash(runtimeType, weapon);
}

abstract class WeaponShowActionGameEvent extends GameEvent {
  const factory WeaponShowActionGameEvent(
          {required final WeaponComponent weapon}) =
      _$WeaponShowActionGameEventImpl;
  const WeaponShowActionGameEvent._() : super._();

  WeaponComponent get weapon;
}

/// @nodoc

class _$WeaponShowProfileGameEventImpl extends WeaponShowProfileGameEvent {
  const _$WeaponShowProfileGameEventImpl() : super._();

  @override
  String toString() {
    return 'GameEvent.weaponShowProfile()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeaponShowProfileGameEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class WeaponShowProfileGameEvent extends GameEvent {
  const factory WeaponShowProfileGameEvent() = _$WeaponShowProfileGameEventImpl;
  const WeaponShowProfileGameEvent._() : super._();
}

/// @nodoc

class _$EnemySpawnGameEventImpl extends EnemySpawnGameEvent {
  const _$EnemySpawnGameEventImpl() : super._();

  @override
  String toString() {
    return 'GameEvent.enemySpawn()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnemySpawnGameEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class EnemySpawnGameEvent extends GameEvent {
  const factory EnemySpawnGameEvent() = _$EnemySpawnGameEventImpl;
  const EnemySpawnGameEvent._() : super._();
}

/// @nodoc

class _$EnemyMissedGameEventImpl extends EnemyMissedGameEvent {
  const _$EnemyMissedGameEventImpl() : super._();

  @override
  String toString() {
    return 'GameEvent.enemyMissed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnemyMissedGameEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class EnemyMissedGameEvent extends GameEvent {
  const factory EnemyMissedGameEvent() = _$EnemyMissedGameEventImpl;
  const EnemyMissedGameEvent._() : super._();
}

/// @nodoc

class _$EnemyKilledGameEventImpl extends EnemyKilledGameEvent {
  const _$EnemyKilledGameEventImpl({required this.mineValue}) : super._();

  @override
  final int mineValue;

  @override
  String toString() {
    return 'GameEvent.enemyKilled(mineValue: $mineValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnemyKilledGameEventImpl &&
            (identical(other.mineValue, mineValue) ||
                other.mineValue == mineValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mineValue);
}

abstract class EnemyKilledGameEvent extends GameEvent {
  const factory EnemyKilledGameEvent({required final int mineValue}) =
      _$EnemyKilledGameEventImpl;
  const EnemyKilledGameEvent._() : super._();

  int get mineValue;
}

/// @nodoc

class _$EnemyNextWaveGameEventImpl extends EnemyNextWaveGameEvent {
  const _$EnemyNextWaveGameEventImpl() : super._();

  @override
  String toString() {
    return 'GameEvent.enemyNextWave()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnemyNextWaveGameEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class EnemyNextWaveGameEvent extends GameEvent {
  const factory EnemyNextWaveGameEvent() = _$EnemyNextWaveGameEventImpl;
  const EnemyNextWaveGameEvent._() : super._();
}
