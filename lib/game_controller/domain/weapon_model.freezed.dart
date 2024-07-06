// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weapon_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WeaponModel {
  WeaponType get type => throw _privateConstructorUsedError;
  String get assetPath => throw _privateConstructorUsedError;
  int get defaultCost => throw _privateConstructorUsedError;
  int get cost => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WeaponModelCopyWith<WeaponModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeaponModelCopyWith<$Res> {
  factory $WeaponModelCopyWith(
          WeaponModel value, $Res Function(WeaponModel) then) =
      _$WeaponModelCopyWithImpl<$Res, WeaponModel>;
  @useResult
  $Res call({WeaponType type, String assetPath, int defaultCost, int cost});
}

/// @nodoc
class _$WeaponModelCopyWithImpl<$Res, $Val extends WeaponModel>
    implements $WeaponModelCopyWith<$Res> {
  _$WeaponModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? assetPath = null,
    Object? defaultCost = null,
    Object? cost = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as WeaponType,
      assetPath: null == assetPath
          ? _value.assetPath
          : assetPath // ignore: cast_nullable_to_non_nullable
              as String,
      defaultCost: null == defaultCost
          ? _value.defaultCost
          : defaultCost // ignore: cast_nullable_to_non_nullable
              as int,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeaponModelImplCopyWith<$Res>
    implements $WeaponModelCopyWith<$Res> {
  factory _$$WeaponModelImplCopyWith(
          _$WeaponModelImpl value, $Res Function(_$WeaponModelImpl) then) =
      __$$WeaponModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({WeaponType type, String assetPath, int defaultCost, int cost});
}

/// @nodoc
class __$$WeaponModelImplCopyWithImpl<$Res>
    extends _$WeaponModelCopyWithImpl<$Res, _$WeaponModelImpl>
    implements _$$WeaponModelImplCopyWith<$Res> {
  __$$WeaponModelImplCopyWithImpl(
      _$WeaponModelImpl _value, $Res Function(_$WeaponModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? assetPath = null,
    Object? defaultCost = null,
    Object? cost = null,
  }) {
    return _then(_$WeaponModelImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as WeaponType,
      assetPath: null == assetPath
          ? _value.assetPath
          : assetPath // ignore: cast_nullable_to_non_nullable
              as String,
      defaultCost: null == defaultCost
          ? _value.defaultCost
          : defaultCost // ignore: cast_nullable_to_non_nullable
              as int,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$WeaponModelImpl extends _WeaponModel {
  const _$WeaponModelImpl(
      {required this.type,
      required this.assetPath,
      required this.defaultCost,
      required this.cost})
      : super._();

  @override
  final WeaponType type;
  @override
  final String assetPath;
  @override
  final int defaultCost;
  @override
  final int cost;

  @override
  String toString() {
    return 'WeaponModel(type: $type, assetPath: $assetPath, defaultCost: $defaultCost, cost: $cost)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeaponModelImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.assetPath, assetPath) ||
                other.assetPath == assetPath) &&
            (identical(other.defaultCost, defaultCost) ||
                other.defaultCost == defaultCost) &&
            (identical(other.cost, cost) || other.cost == cost));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, type, assetPath, defaultCost, cost);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeaponModelImplCopyWith<_$WeaponModelImpl> get copyWith =>
      __$$WeaponModelImplCopyWithImpl<_$WeaponModelImpl>(this, _$identity);
}

abstract class _WeaponModel extends WeaponModel {
  const factory _WeaponModel(
      {required final WeaponType type,
      required final String assetPath,
      required final int defaultCost,
      required final int cost}) = _$WeaponModelImpl;
  const _WeaponModel._() : super._();

  @override
  WeaponType get type;
  @override
  String get assetPath;
  @override
  int get defaultCost;
  @override
  int get cost;
  @override
  @JsonKey(ignore: true)
  _$$WeaponModelImplCopyWith<_$WeaponModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
