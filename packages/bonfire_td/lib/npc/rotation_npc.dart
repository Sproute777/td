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
/// on 22/03/22

/// Npc used for top-down perspective
class RotationNpc extends Npc with UseSpriteAnimation, UseAssetsLoader {
  SpriteAnimation? animIdle;
  SpriteAnimation? animRun;

  RotationNpc({
    required Vector2 position,
    required Vector2 size,
    required Future<SpriteAnimation> animIdle,
    required Future<SpriteAnimation> animRun,
    double currentRadAngle = -1.55,
    double? speed,
  }) : super(
          position: position,
          size: size,
          speed: speed,
        ) {
    angle = currentRadAngle;
    loader?.add(AssetToLoad(animIdle, (value) {
      this.animIdle = value;
    }));
    loader?.add(AssetToLoad(animRun, (value) {
      this.animRun = value;
    }));
  }

  @override
  void moveFromAngle(double angle, {double? speed}) {
    setAnimation(animRun);
    this.angle = angle;
    super.moveFromAngle(angle, speed: speed);
  }

  @override
  void idle() {
    setAnimation(animIdle);
    super.idle();
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    idle();
  }

  @override
  void onMount() {
    anchor = Anchor.center;
    super.onMount();
  }
}
