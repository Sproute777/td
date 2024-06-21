import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import '../base/game_component.dart';
import '../game_controller/game_event.dart';

class MapTileComponent extends GameComponent with TapCallbacks {
  // MapTileBuildStatus buildStatus = MapTileBuildStatus.Empty;
  GameComponent? refComponent;
  bool ableToBuild = true;
  Sprite? background;

  MapTileComponent({
    super.position,
    super.size,
  });

  @override
  void render(canvas) {
    super.render(canvas);
    // if (background != null) {
    // background!.renderRect(c, size.toRect());
    canvas.drawRect(
        size.toRect(),
        Paint()
          ..style = PaintingStyle.stroke
          ..color = Colors.cyan);
  }

  @override
  bool onTapDown(TapDownEvent event) {
    final paused = gameRef.paused;
    if (!paused) {
      gameRef.gameController.send(GameEvent.weaponBuilding(component: this));
      return false;
    }
    return false;
  }
}
