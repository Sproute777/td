// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weapon_type_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WeaponTypeState {
  WeaponType get type => throw _privateConstructorUsedError;
}

/// @nodoc

class _$WeaponTypeStateImpl extends _WeaponTypeState {
  const _$WeaponTypeStateImpl({required this.type}) : super._();

  @override
  final WeaponType type;

  @override
  String toString() {
    return 'WeaponTypeState(type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeaponTypeStateImpl &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type);
}

abstract class _WeaponTypeState extends WeaponTypeState {
  const factory _WeaponTypeState({required final WeaponType type}) =
      _$WeaponTypeStateImpl;
  const _WeaponTypeState._() : super._();

  @override
  WeaponType get type;
}
