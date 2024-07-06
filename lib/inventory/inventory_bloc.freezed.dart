// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InventoryState {}

/// @nodoc

class _$InitInventoryBlocImpl extends InitInventoryBloc {
  const _$InitInventoryBlocImpl() : super._();

  @override
  String toString() {
    return 'InventoryState.init()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitInventoryBlocImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class InitInventoryBloc extends InventoryState {
  const factory InitInventoryBloc() = _$InitInventoryBlocImpl;
  const InitInventoryBloc._() : super._();
}

/// @nodoc

class _$LoadedInventoryBlocImpl extends LoadedInventoryBloc {
  const _$LoadedInventoryBlocImpl(final List<WeaponModel> weapons)
      : _weapons = weapons,
        super._();

  final List<WeaponModel> _weapons;
  @override
  List<WeaponModel> get weapons {
    if (_weapons is EqualUnmodifiableListView) return _weapons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weapons);
  }

  @override
  String toString() {
    return 'InventoryState.loaded(weapons: $weapons)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedInventoryBlocImpl &&
            const DeepCollectionEquality().equals(other._weapons, _weapons));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_weapons));
}

abstract class LoadedInventoryBloc extends InventoryState {
  const factory LoadedInventoryBloc(final List<WeaponModel> weapons) =
      _$LoadedInventoryBlocImpl;
  const LoadedInventoryBloc._() : super._();

  List<WeaponModel> get weapons;
}
