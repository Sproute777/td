import 'dart:math';

import 'package:astar_dart/astar_dart.dart';
import 'package:flame/components.dart';

mixin AstarMapMixin on Component {
  late AStarSquareGrid astarMap;
  late Vector2 tileSize;

  void astarMapInit(Vector2 size) {
    astarMap = AStarSquareGrid(rows: size.x.toInt(), columns: size.y.toInt());
  }

  void astarMapAddObstacle(Vector2 position) {
    final node = _positionToNode(position);
    astarMap.setBarrier(node.toBarrier(Barrier.block));
  }

  void astarMapRemoveObstacle(Vector2 position) {
    final node = _positionToNode(position);
    astarMap.setBarrier(node.toBarrier(Barrier.pass));
  }

  List<Point<int>> astarMapResolve(Vector2 start, Vector2 end) {
    astarMap.calculateGrid();
    final start0 = _positionToNode(start);
    final end0 = _positionToNode(end);
    final path = astarMap.findPath(start: start0, end: end0);
    return path;
  }

  Point<int> _positionToNode(Vector2 position) {
    return Point<int>(position.x ~/ tileSize.x, position.y ~/ tileSize.y);
  }

  // leftTop position
  Vector2 nodeToPosition(Point<int> node) {
    return Vector2(node.x * tileSize.x, node.y * tileSize.y);
  }
}
