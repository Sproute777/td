import 'dart:math';

import 'package:astar_dart/astar_dart.dart';
import 'package:flame/components.dart';

mixin AstarMapMixin on Component {
  late AStarSquareGrid astarMap;
  late Vector2 tileSize;

  void astarInit(Vector2 size) {
    astarMap = AStarSquareGrid(rows: size.x.toInt(), columns: size.y.toInt());
  }

  void addBarrier(Vector2 position) {
    final node = _positionToNode(position);
    astarMap.setBarrier(node.toBarrier(Barrier.block));
  }

  void removeBarrier(Vector2 position) {
    final node = _positionToNode(position);
    astarMap.setBarrier(node.toBarrier(Barrier.pass));
  }

  Future<List<Point<int>>> findPath(Vector2 start, Vector2 end) async {
    astarMap.calculateGrid();
    final start0 = _positionToNode(start);
    final end0 = _positionToNode(end);
    final path = await astarMap.findPath(start: start0, end: end0);
    return path.toPointList();
  }

  Point<int> _positionToNode(Vector2 position) {
    return Point<int>(position.x ~/ tileSize.x, position.y ~/ tileSize.y);
  }

  // leftTop position
  Vector2 nodeToPosition(Point<int> node) {
    return Vector2(node.x * tileSize.x, node.y * tileSize.y);
  }
}
