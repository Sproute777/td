// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weapon_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WeaponDto _$WeaponDtoFromJson(Map<String, dynamic> json) {
  return _WeaponDto.fromJson(json);
}

/// @nodoc
mixin _$WeaponDto {
  String get lable => throw _privateConstructorUsedError;
  int get cost => throw _privateConstructorUsedError;
  double get range => throw _privateConstructorUsedError;
  double get damage => throw _privateConstructorUsedError;
  double get fireInterval => throw _privateConstructorUsedError;
  double get rotateSpeed => throw _privateConstructorUsedError;
  double get bulletSpeed => throw _privateConstructorUsedError;
  double get sizeX => throw _privateConstructorUsedError;
  double get sizeY => throw _privateConstructorUsedError;
  double get bulletSizeX => throw _privateConstructorUsedError;
  double get bulletSizeY => throw _privateConstructorUsedError;
  double get exposionSizeX => throw _privateConstructorUsedError;
  double get exposionSizeY => throw _privateConstructorUsedError;
  String get barrelImg0 => throw _privateConstructorUsedError;
  String get barrelImg1 => throw _privateConstructorUsedError;
  String get barrelImg2 => throw _privateConstructorUsedError;
  String get bulletImg => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$WeaponDtoImpl extends _WeaponDto {
  const _$WeaponDtoImpl(
      {required this.lable,
      required this.cost,
      required this.range,
      required this.damage,
      required this.fireInterval,
      required this.rotateSpeed,
      required this.bulletSpeed,
      required this.sizeX,
      required this.sizeY,
      required this.bulletSizeX,
      required this.bulletSizeY,
      required this.exposionSizeX,
      required this.exposionSizeY,
      required this.barrelImg0,
      required this.barrelImg1,
      required this.barrelImg2,
      required this.bulletImg})
      : super._();

  factory _$WeaponDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeaponDtoImplFromJson(json);

  @override
  final String lable;
  @override
  final int cost;
  @override
  final double range;
  @override
  final double damage;
  @override
  final double fireInterval;
  @override
  final double rotateSpeed;
  @override
  final double bulletSpeed;
  @override
  final double sizeX;
  @override
  final double sizeY;
  @override
  final double bulletSizeX;
  @override
  final double bulletSizeY;
  @override
  final double exposionSizeX;
  @override
  final double exposionSizeY;
  @override
  final String barrelImg0;
  @override
  final String barrelImg1;
  @override
  final String barrelImg2;
  @override
  final String bulletImg;

  @override
  String toString() {
    return 'WeaponDto(lable: $lable, cost: $cost, range: $range, damage: $damage, fireInterval: $fireInterval, rotateSpeed: $rotateSpeed, bulletSpeed: $bulletSpeed, sizeX: $sizeX, sizeY: $sizeY, bulletSizeX: $bulletSizeX, bulletSizeY: $bulletSizeY, exposionSizeX: $exposionSizeX, exposionSizeY: $exposionSizeY, barrelImg0: $barrelImg0, barrelImg1: $barrelImg1, barrelImg2: $barrelImg2, bulletImg: $bulletImg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeaponDtoImpl &&
            (identical(other.lable, lable) || other.lable == lable) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.range, range) || other.range == range) &&
            (identical(other.damage, damage) || other.damage == damage) &&
            (identical(other.fireInterval, fireInterval) ||
                other.fireInterval == fireInterval) &&
            (identical(other.rotateSpeed, rotateSpeed) ||
                other.rotateSpeed == rotateSpeed) &&
            (identical(other.bulletSpeed, bulletSpeed) ||
                other.bulletSpeed == bulletSpeed) &&
            (identical(other.sizeX, sizeX) || other.sizeX == sizeX) &&
            (identical(other.sizeY, sizeY) || other.sizeY == sizeY) &&
            (identical(other.bulletSizeX, bulletSizeX) ||
                other.bulletSizeX == bulletSizeX) &&
            (identical(other.bulletSizeY, bulletSizeY) ||
                other.bulletSizeY == bulletSizeY) &&
            (identical(other.exposionSizeX, exposionSizeX) ||
                other.exposionSizeX == exposionSizeX) &&
            (identical(other.exposionSizeY, exposionSizeY) ||
                other.exposionSizeY == exposionSizeY) &&
            (identical(other.barrelImg0, barrelImg0) ||
                other.barrelImg0 == barrelImg0) &&
            (identical(other.barrelImg1, barrelImg1) ||
                other.barrelImg1 == barrelImg1) &&
            (identical(other.barrelImg2, barrelImg2) ||
                other.barrelImg2 == barrelImg2) &&
            (identical(other.bulletImg, bulletImg) ||
                other.bulletImg == bulletImg));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      lable,
      cost,
      range,
      damage,
      fireInterval,
      rotateSpeed,
      bulletSpeed,
      sizeX,
      sizeY,
      bulletSizeX,
      bulletSizeY,
      exposionSizeX,
      exposionSizeY,
      barrelImg0,
      barrelImg1,
      barrelImg2,
      bulletImg);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeaponDtoImplToJson(
      this,
    );
  }
}

abstract class _WeaponDto extends WeaponDto {
  const factory _WeaponDto(
      {required final String lable,
      required final int cost,
      required final double range,
      required final double damage,
      required final double fireInterval,
      required final double rotateSpeed,
      required final double bulletSpeed,
      required final double sizeX,
      required final double sizeY,
      required final double bulletSizeX,
      required final double bulletSizeY,
      required final double exposionSizeX,
      required final double exposionSizeY,
      required final String barrelImg0,
      required final String barrelImg1,
      required final String barrelImg2,
      required final String bulletImg}) = _$WeaponDtoImpl;
  const _WeaponDto._() : super._();

  factory _WeaponDto.fromJson(Map<String, dynamic> json) =
      _$WeaponDtoImpl.fromJson;

  @override
  String get lable;
  @override
  int get cost;
  @override
  double get range;
  @override
  double get damage;
  @override
  double get fireInterval;
  @override
  double get rotateSpeed;
  @override
  double get bulletSpeed;
  @override
  double get sizeX;
  @override
  double get sizeY;
  @override
  double get bulletSizeX;
  @override
  double get bulletSizeY;
  @override
  double get exposionSizeX;
  @override
  double get exposionSizeY;
  @override
  String get barrelImg0;
  @override
  String get barrelImg1;
  @override
  String get barrelImg2;
  @override
  String get bulletImg;
}
