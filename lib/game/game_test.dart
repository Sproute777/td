import 'package:flutter/cupertino.dart';

import 'game_main.dart';

class GameTest extends GameMain with GameDebug {
  GameTest({
    required super.gameController,
    // required super.stageBarBloc,
    // required super.inventoryBloc
  });

  @override
  Future<void> onLoad() async {
    // recordTime();
    await super.onLoad();

    // timeDelay("Game onLoad ");
  }

  @override
  void update(double t) {
    recordTime();
    super.update(t);
    timeDelay('Game update ');
    // if (loadDone) listComponents();
  }

  @override
  void render(canvas) {
    recordTime();
    super.render(canvas);
    timeDelay('Game render ');
  }
}

mixin GameDebug on GameMain {
  bool debug = false;
  @override
  int currentTimeMillis() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  int timeRecord = 0;
  void recordTime() {
    if (debug) {
      timeRecord = currentTimeMillis();
    }
  }

  void timeDelay(String m) {
    if (debug) {
      if (timeRecord > 0) {
        final int d = currentTimeMillis() - timeRecord;
        debugPrint('$m takes $d');
        timeRecord = 0;
      }
    }
  }

  @override
  void update(double t) {
    if (t < 1) {
      super.update(t);
    }
  }

  void loopChildren(c) {
    if (c.children.length > 0) {
      c.children.forEach((e) => loopChildren(e));
    }
  }
}
