// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weapon_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeaponDtoImpl _$$WeaponDtoImplFromJson(Map<String, dynamic> json) =>
    _$WeaponDtoImpl(
      lable: json['lable'] as String,
      cost: (json['cost'] as num).toInt(),
      range: (json['range'] as num).toDouble(),
      damage: (json['damage'] as num).toDouble(),
      fireInterval: (json['fireInterval'] as num).toDouble(),
      rotateSpeed: (json['rotateSpeed'] as num).toDouble(),
      bulletSpeed: (json['bulletSpeed'] as num).toDouble(),
      sizeX: (json['sizeX'] as num).toDouble(),
      sizeY: (json['sizeY'] as num).toDouble(),
      bulletSizeX: (json['bulletSizeX'] as num).toDouble(),
      bulletSizeY: (json['bulletSizeY'] as num).toDouble(),
      exposionSizeX: (json['exposionSizeX'] as num).toDouble(),
      exposionSizeY: (json['exposionSizeY'] as num).toDouble(),
      barrelImg0: json['barrelImg0'] as String,
      barrelImg1: json['barrelImg1'] as String,
      barrelImg2: json['barrelImg2'] as String,
      bulletImg: json['bulletImg'] as String,
    );

Map<String, dynamic> _$$WeaponDtoImplToJson(_$WeaponDtoImpl instance) =>
    <String, dynamic>{
      'lable': instance.lable,
      'cost': instance.cost,
      'range': instance.range,
      'damage': instance.damage,
      'fireInterval': instance.fireInterval,
      'rotateSpeed': instance.rotateSpeed,
      'bulletSpeed': instance.bulletSpeed,
      'sizeX': instance.sizeX,
      'sizeY': instance.sizeY,
      'bulletSizeX': instance.bulletSizeX,
      'bulletSizeY': instance.bulletSizeY,
      'exposionSizeX': instance.exposionSizeX,
      'exposionSizeY': instance.exposionSizeY,
      'barrelImg0': instance.barrelImg0,
      'barrelImg1': instance.barrelImg1,
      'barrelImg2': instance.barrelImg2,
      'bulletImg': instance.bulletImg,
    };
