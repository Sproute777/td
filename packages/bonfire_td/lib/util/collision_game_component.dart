import 'package:bonfire/bonfire.dart';

///
/// Created by
///
/// ─▄▀─▄▀
/// ──▀──▀
/// █▀▀▀▀▀█▄
/// █░░░░░█─█
/// ▀▄▄▄▄▄▀▀
///
/// Rafaelbarbosatec
/// on 10/12/21

class CollisionMapComponent extends GameComponent {
  final String name;
  List<ShapeHitbox>? collisions;

  CollisionMapComponent({
    this.name = '',
    Map<String, dynamic>? properties,
    required Vector2 position,
    required Vector2 size,
    this.collisions,
  }) {
    this.properties = properties;
    this.position = position;
    this.size = size;
  }

  @override
  Future<void> onLoad() async {
    collisions?.let(addAll);
    return super.onLoad();
  }
}
