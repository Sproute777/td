import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../settings/weapon_settings.dart';
import 'weapon_model.dart';

@lazySingleton
class GameRepository {
  GameRepository();

  final mineralsNotifier = ValueNotifier(0);
  final waveNotifier = ValueNotifier(0);
  final missedNotifier = ValueNotifier(0);
  final killedNotifier = ValueNotifier(0);

  void incrementWave() {
    waveNotifier.value += 1;
  }

  void incrementMissed() {
    missedNotifier.value += 1;
  }

  void incrementKilled() {
    killedNotifier.value += 1;
  }

  void subtractMinerals(WeaponType type) {
    final int cost = weaponsNotifier.value[type.index].cost;
    mineralsNotifier.value -= cost;
  }

  void addMinerals(int value) {
    mineralsNotifier.value += value;
  }

//-------------------------------------------
  final weaponsNotifier = ValueNotifier(<WeaponModel>[]);

  final selectedTypeNotifier = ValueNotifier(WeaponType.none);

  void init() {
    final list = WeaponSettings.list.map((i) {
      return WeaponModel(
          assetPath: i.barrelImg0,
          cost: i.cost,
          defaultCost: i.cost,
          type: i.type);
    }).toList();
    weaponsNotifier.value = list;
  }

  void selectedWeapon(WeaponType type) {
    selectedTypeNotifier.value = type;
  }

  // void setCost({
  //   required int cost,
  //   required int index,
  // }) {
  //   final weapon = weaponsNotifier.value[index];
  //   weaponsNotifier.value = List.of(weaponsNotifier.value)
  //     ..[index] = weapon.copyWith(cost: cost);
  // }

  void addCost(int index) {
    final weapon = weaponsNotifier.value[index];
    weaponsNotifier.value = List.of(weaponsNotifier.value)
      ..[index] = weapon.copyWith(
          cost: (weapon.defaultCost * 0.2).toInt() + weapon.cost);
  }

  void subtractCost(int index) {
    final weapon = weaponsNotifier.value[index];
    weaponsNotifier.value = List.of(weaponsNotifier.value)
      ..[index] = weapon.copyWith(
          cost: weapon.cost - (weapon.defaultCost * 0.2).toInt());
  }
}
