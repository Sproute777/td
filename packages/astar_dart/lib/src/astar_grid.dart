import 'dart:math';

import 'package:astar_dart/src/astar_node.dart';

/// base class for all AstarGrid
abstract class AstarGrid {
  AstarNode? findNodeWinner(
      {void Function(List<Point<int>>)? doneList,
      required Point<int> start,
      required Point<int> end});

  List<Point<int>> findPath(
      {void Function(List<Point<int>>)? doneList,
      required Point<int> start,
      required Point<int> end});
}
