import 'package:flame/extensions.dart';

import '../base/game_component.dart';
import 'astarmap_minxin.dart';
import 'map_tile_component.dart';

class MapController extends GameComponent with AstarMapMixin {
  late Vector2 tileSize;
  late Vector2 mapGrid;

  MapController({
    required this.tileSize,
    required this.mapGrid,
    super.position,
    super.size,
  });

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    for (var w = 0; w < mapGrid.x; w++) {
      for (var h = 0; h < mapGrid.y; h++) {
        add(MapTileComponent(
            position: Vector2(w * tileSize.x, h * tileSize.y) +
                (Vector2(tileSize.x / 2, tileSize.y / 2)),
            size: tileSize));
      }
    }

    astarMapInit(mapGrid);
  }

  bool testBlock(Vector2 position) {
    astarMapAddObstacle(position);
    final path = astarMapResolve(
        gameRef.setting.enemySpawn, gameRef.setting.enemyTarget);
    astarMapRemoveObstacle(position);
    return path.isEmpty;
  }
}
