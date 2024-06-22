import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GameRepository {
  GameRepository();

  final mineralsNTF = ValueNotifier(0);
  final waveNTF = ValueNotifier(0);
  final missedNTF = ValueNotifier(0);
  final killedNTF = ValueNotifier(0);

  void incrementWave() {
    waveNTF.value += 1;
  }

  void incrementMissed() {
    missedNTF.value += 1;
  }

  void incrementKilled() {
    killedNTF.value += 1;
  }

  void subtractMinerals(int value) {
    mineralsNTF.value -= value;
  }

  void addMinerals(int value) {
    mineralsNTF.value += value;
  }
}
