enum Barrier {
  // Can move through the barrier
  pass,

  // Cannot move through the barrier
  block,

  // Can move through but cannot stop on it
  passThrough,
}

extension BarrierExt on Barrier {
  bool get isBlock => this == Barrier.block;
  bool get isPass => this == Barrier.pass;
  bool get isPathThrough => this == Barrier.passThrough;
}
