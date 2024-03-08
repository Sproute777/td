import 'package:flame/components.dart';
import '../astar/astarmap.dart';
import '../astar/astarnode.dart';

mixin AstarMapMixin {
  late AstarMap astarMap;
  late Vector2 tileSize;

  void astarMapInit(Vector2 size) {
    astarMap = AstarMap(size.x.toInt(), size.y.toInt());
  }

  void astarMapAddObstacle(Vector2 position) {
    final AstarNode node = _positionToNode(position);
    astarMap.addObstacle(node.x, node.y);
  }

  void astarMapRemoveObstacle(Vector2 position) {
    final AstarNode node = _positionToNode(position);
    astarMap.removeObstacle(node.x, node.y);
  }

  AstarNode? astarMapResolve(Vector2 start, Vector2 end) {
    final AstarNode start0 = _positionToNode(start);
    final AstarNode end0 = _positionToNode(end);
    final AstarNode? goal = astarMap.astar(start0, end0);
    AstarNode? node = goal;
    if (goal == null) {
      return null;
    }

    while (node!.parent != null) {
      node.parent!.next = node;
      node = node.parent;
    }
    return node;
  }

  Vector2? astarMapResolveNextPosition(Vector2 start, Vector2 end) {
    AstarNode? node = astarMapResolve(start, end);
    return node != null ? nodeToPosition(node.next!) : null;
  }

  AstarNode _positionToNode(Vector2 position) {
    return AstarNode(position.x ~/ tileSize.x, position.y ~/ tileSize.y);
  }

  // leftTop position
  Vector2 nodeToPosition(AstarNode node) {
    return Vector2(node.x * tileSize.x, node.y * tileSize.y);
  }
}
