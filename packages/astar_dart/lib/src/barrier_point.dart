import 'dart:math';

import '../astar_dart.dart';

class BarrierPoint extends Point<int> {
  const BarrierPoint(super.x, super.y, {required this.barrier});
  final Barrier barrier;
}
