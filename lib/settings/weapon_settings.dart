// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'weapon_settings.freezed.dart';
part 'weapon_settings.g.dart';

@Freezed(
    map: FreezedMapOptions.none, when: FreezedWhenOptions.none, copyWith: false)
class WeaponSettings with _$WeaponSettings {
  const WeaponSettings._();

  const factory WeaponSettings({
    required WeaponType type,
    required int cost,
    required double range,
    required double damage,
    required double fireInterval,
    required double rotateSpeed,
    required double bulletSpeed,
    required double sizeX,
    required double sizeY,
    required double bulletSizeX,
    required double bulletSizeY,
    required double exposionSizeX,
    required double exposionSizeY,
    required String barrelImg0,
    required String barrelImg1,
    required String barrelImg2,
    required String bulletImg,
  }) = _WeaponSettings;

  /// Generate WeaponSettings class from Map<String, Object?>
  factory WeaponSettings.fromJson(Map<String, Object?> json) =>
      _$WeaponSettingsFromJson(json);

  static const list = <WeaponSettings>[
    WeaponSettings(
        type: WeaponType.cannon,
        cost: 10,
        damage: 10,
        range: 1.5,
        fireInterval: 0.8,
        rotateSpeed: 2.0,
        bulletSpeed: 2.0,
        sizeX: 0.8,
        sizeY: 0.8,
        bulletSizeX: 0.1,
        bulletSizeY: 0.2,
        exposionSizeX: 0.8,
        exposionSizeY: 0.8,
        barrelImg0: 'Cannon',
        barrelImg1: 'Cannon2',
        barrelImg2: 'Cannon3',
        bulletImg: 'Bullet1'),
    WeaponSettings(
        type: WeaponType.mg,
        cost: 15,
        damage: 5,
        range: 2.0,
        fireInterval: 0.2,
        rotateSpeed: 4.0,
        bulletSpeed: 5.0,
        sizeX: 0.8,
        sizeY: 0.8,
        bulletSizeX: 0.1,
        bulletSizeY: 0.3,
        exposionSizeX: 0.5,
        exposionSizeY: 0.5,
        barrelImg0: 'MG',
        barrelImg1: 'MG2',
        barrelImg2: 'MG3',
        bulletImg: 'Bullet2'),
    WeaponSettings(
        type: WeaponType.missele,
        cost: 30,
        range: 3.0,
        damage: 40,
        fireInterval: 1.5,
        rotateSpeed: 0.7,
        bulletSpeed: 0.7,
        sizeX: 0.9,
        sizeY: 0.9,
        bulletSizeX: 0.3,
        bulletSizeY: 0.4,
        exposionSizeX: 0.7,
        exposionSizeY: 0.7,
        barrelImg0: 'Missile_Launcher',
        barrelImg1: 'Missile_Launcher2',
        barrelImg2: 'Missile_Launcher3',
        bulletImg: 'Missile'),
  ];
}

enum WeaponType { cannon, mg, missele, minner, none }
