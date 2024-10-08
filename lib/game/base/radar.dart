import 'package:flame/components.dart';
import '../enemy/enemy_component.dart';

mixin Radar<T> on PositionComponent {
  bool _radarOn = false;
  bool radarScanBest = false;
  double radarRange = 0;
  double radarCollisionDepth = 0.1;
  void Function(PositionComponent)? radarScanAlert;
  void Function()? radarScanNothing;

  set radarOn(bool e) {
    _radarOn = e;
  }

  bool get radarOn => _radarOn;

  void radarScan(Iterable<Component> targets) {
    if (radarOn) {
      _bestDistance = 100000;
      final Iterable<Component> targets0 = targets
          .where((e) => (e is T) && ((e as EnemyComponent).active))
          .cast();
      targets0
          .takeWhile((value) => _collisionTest(value as PositionComponent))
          .forEach((element) {});

      if (_bestTarget != null) {
        radarScanAlert?.call(_bestTarget!);
        _bestTarget = null;
      } else {
        radarScanNothing?.call();
      }
    }
  }

  double _bestDistance = 100000;
  PositionComponent? _bestTarget;

  bool _collisionTest(PositionComponent target) {
    final Vector2 targetPosition = target.position;
    final double targetCollisionSize = (target.size.x + target.size.y) / 4;
    double collisionRange = targetCollisionSize + radarRange;
    collisionRange = collisionRange * (1 - radarCollisionDepth);
    final double distance = position.distanceTo(targetPosition);
    if (distance < collisionRange) {
      if (radarScanBest) {
        if (distance < _bestDistance) {
          _bestDistance = distance;
          _bestTarget = target;
        }
        return true;
      } else {
        _bestTarget = target;
        return false;
      }
    }
    return true;
  }

  bool collision(PositionComponent target) {
    final Vector2 targetPosition = target.position;
    final double targetCollisionSize = (target.size.x + target.size.y) / 4;
    double collisionRange = targetCollisionSize + radarRange;
    collisionRange = collisionRange * (1 - radarCollisionDepth);
    final double distance = position.distanceTo(targetPosition);
    if (distance < collisionRange) {
      return true;
    }
    return false;
  }
}
