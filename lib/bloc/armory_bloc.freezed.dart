// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'armory_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ArmoryEvent {
  GameComponent get c => throw _privateConstructorUsedError;
}

/// @nodoc

class _$StartOfConstructionArmoryEventImpl
    extends StartOfConstructionArmoryEvent {
  const _$StartOfConstructionArmoryEventImpl(this.c, this.t) : super._();

  @override
  final GameComponent c;
  @override
  final WeaponType t;

  @override
  String toString() {
    return 'ArmoryEvent.startOfConstruction(c: $c, t: $t)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartOfConstructionArmoryEventImpl &&
            (identical(other.c, c) || other.c == c) &&
            (identical(other.t, t) || other.t == t));
  }

  @override
  int get hashCode => Object.hash(runtimeType, c, t);
}

abstract class StartOfConstructionArmoryEvent extends ArmoryEvent {
  const factory StartOfConstructionArmoryEvent(
          final GameComponent c, final WeaponType t) =
      _$StartOfConstructionArmoryEventImpl;
  const StartOfConstructionArmoryEvent._() : super._();

  @override
  GameComponent get c;
  WeaponType get t;
}

/// @nodoc

class _$EndOfConstructionArmoryEventImpl extends EndOfConstructionArmoryEvent {
  const _$EndOfConstructionArmoryEventImpl(this.c, this.t) : super._();

  @override
  final GameComponent c;
  @override
  final WeaponType t;

  @override
  String toString() {
    return 'ArmoryEvent.endOfConstruction(c: $c, t: $t)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EndOfConstructionArmoryEventImpl &&
            (identical(other.c, c) || other.c == c) &&
            (identical(other.t, t) || other.t == t));
  }

  @override
  int get hashCode => Object.hash(runtimeType, c, t);
}

abstract class EndOfConstructionArmoryEvent extends ArmoryEvent {
  const factory EndOfConstructionArmoryEvent(
          final GameComponent c, final WeaponType t) =
      _$EndOfConstructionArmoryEventImpl;
  const EndOfConstructionArmoryEvent._() : super._();

  @override
  GameComponent get c;
  WeaponType get t;
}

/// @nodoc

class _$BlockedArmoryEventImpl extends BlockedArmoryEvent {
  const _$BlockedArmoryEventImpl(this.c) : super._();

  @override
  final WeaponComponent c;

  @override
  String toString() {
    return 'ArmoryEvent.blocked(c: $c)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlockedArmoryEventImpl &&
            (identical(other.c, c) || other.c == c));
  }

  @override
  int get hashCode => Object.hash(runtimeType, c);
}

abstract class BlockedArmoryEvent extends ArmoryEvent {
  const factory BlockedArmoryEvent(final WeaponComponent c) =
      _$BlockedArmoryEventImpl;
  const BlockedArmoryEvent._() : super._();

  @override
  WeaponComponent get c;
}

/// @nodoc

class _$DemolitionArmoryEventImpl extends DemolitionArmoryEvent {
  const _$DemolitionArmoryEventImpl(this.c) : super._();

  @override
  final WeaponComponent c;

  @override
  String toString() {
    return 'ArmoryEvent.demolition(c: $c)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DemolitionArmoryEventImpl &&
            (identical(other.c, c) || other.c == c));
  }

  @override
  int get hashCode => Object.hash(runtimeType, c);
}

abstract class DemolitionArmoryEvent extends ArmoryEvent {
  const factory DemolitionArmoryEvent(final WeaponComponent c) =
      _$DemolitionArmoryEventImpl;
  const DemolitionArmoryEvent._() : super._();

  @override
  WeaponComponent get c;
}

/// @nodoc
mixin _$ArmoryState {}

/// @nodoc

class _$InitArmoryStateImpl extends InitArmoryState {
  const _$InitArmoryStateImpl() : super._();

  @override
  String toString() {
    return 'ArmoryState.init()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitArmoryStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class InitArmoryState extends ArmoryState {
  const factory InitArmoryState() = _$InitArmoryStateImpl;
  const InitArmoryState._() : super._();
}

/// @nodoc

class _$ProcessingArmoryStateImpl extends ProcessingArmoryState {
  const _$ProcessingArmoryStateImpl() : super._();

  @override
  String toString() {
    return 'ArmoryState.processing()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProcessingArmoryStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class ProcessingArmoryState extends ArmoryState {
  const factory ProcessingArmoryState() = _$ProcessingArmoryStateImpl;
  const ProcessingArmoryState._() : super._();
}

/// @nodoc

class _$PathBlockedArmoryStateImpl extends PathBlockedArmoryState {
  const _$PathBlockedArmoryStateImpl() : super._();

  @override
  String toString() {
    return 'ArmoryState.pathBlocked()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PathBlockedArmoryStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class PathBlockedArmoryState extends ArmoryState {
  const factory PathBlockedArmoryState() = _$PathBlockedArmoryStateImpl;
  const PathBlockedArmoryState._() : super._();
}

/// @nodoc

class _$ConstructionCompletedArmoryStateImpl
    extends ConstructionCompletedArmoryState {
  const _$ConstructionCompletedArmoryStateImpl() : super._();

  @override
  String toString() {
    return 'ArmoryState.constructionCompleted()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConstructionCompletedArmoryStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class ConstructionCompletedArmoryState extends ArmoryState {
  const factory ConstructionCompletedArmoryState() =
      _$ConstructionCompletedArmoryStateImpl;
  const ConstructionCompletedArmoryState._() : super._();
}

/// @nodoc

class _$DeniedArmoryStateImpl extends DeniedArmoryState {
  const _$DeniedArmoryStateImpl() : super._();

  @override
  String toString() {
    return 'ArmoryState.denied()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DeniedArmoryStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class DeniedArmoryState extends ArmoryState {
  const factory DeniedArmoryState() = _$DeniedArmoryStateImpl;
  const DeniedArmoryState._() : super._();
}
