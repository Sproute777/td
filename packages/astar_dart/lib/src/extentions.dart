import 'dart:math';

import 'package:astar_dart/astar_dart.dart';

extension AstarListNodeExt on List<AstarNode> {
  List<Point<int>> toPointList() => map((n) => Point(n.x, n.y)).toList();
}

extension AstarNodeExt on AstarNode {
  Point<int> toPoint() => Point<int>(x, y);
}


extension PointExt on Point<int>{
  BarrierPoint toBarrier(Barrier barrier)=> BarrierPoint(x, y, barrier: barrier);
}