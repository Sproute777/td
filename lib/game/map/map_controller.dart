import 'package:flame/components.dart';

import '../game_main.dart';
import '../util/priority.dart';
import 'astarmap_minxin.dart';
import 'map_tile_component.dart';

class MapController extends Component with AstarMapMixin, HasGameRef<GameMain> {
  late Vector2 tileSize;
  late Vector2 mapGrid;

  MapController(
      {required this.tileSize,
      required this.mapGrid,
      super.priority = Priority.controller});

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

    super.astarInit(mapGrid);
  }

  Future<bool> isBlockPath(Vector2 position) async {
    super.addBarrier(position);
    final path = await super
        .findPath(gameRef.setting.enemySpawn, gameRef.setting.enemyTarget);
    super.removeBarrier(position);
    return path.isEmpty;
  }
}
