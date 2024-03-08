import 'package:flame/components.dart';
import 'package:flame/input.dart';
// import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import '../base/game_component.dart';
import '../game_controller/game_controller.dart';

enum MapTileBuildStatus { Empty, BuildPreview, BuildDone }

enum MapTileBuildEvent { None, BuildPreview, BuildDone, BuildCancel }

class MapTileComponent extends GameComponent with Tappable {
  MapTileBuildStatus buildStatus = MapTileBuildStatus.Empty;
  GameComponent? refComponent;
  bool ableToBuild = true;
  Sprite? background;

  MapTileComponent({
    super.position,
    super.size,
  });

  void render(Canvas c) {
    super.render(c);
    // if (background != null) {
    // background!.renderRect(c, size.toRect());
    c.drawRect(
        size.toRect(),
        Paint()
          ..style = PaintingStyle.stroke
          ..color = Colors.green);
  }

  @override
  bool onTapDown(TapDownInfo event) {
    final paused = gameRef.paused;
    if (!paused) {
      gameRef.gameController.send(this, GameControl.weaponBuilding);
      return false;
    }
    return false;
  }
}
