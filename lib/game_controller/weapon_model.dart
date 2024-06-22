import 'package:freezed_annotation/freezed_annotation.dart';

import '../settings/weapon_settings.dart';
part 'weapon_model.freezed.dart';

@Freezed(
    map: FreezedMapOptions.none, when: FreezedWhenOptions.none, copyWith: true)
class WeaponModel with _$WeaponModel {
  const WeaponModel._();
  const factory WeaponModel({
    required WeaponType type,
    required String assetPath,
    required int defaultCost,
    required int cost,
  }) = _WeaponModel;
}
