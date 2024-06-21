import 'package:flame/components.dart';
import 'package:flame/widgets.dart';
import 'package:flutter/material.dart';

import '../../game/game_main.dart';
import '../../game/game_setting.dart';
import '../../game_controller/game_event.dart';
import '../../weapon/weapon_component.dart';

class WeaponViewWidget {
  static const String name = 'weaponview';
  static Widget builder(BuildContext buildContext, GameMain game) {
    final Size fullScreenSize = MediaQuery.of(buildContext).size;
    debugPrint('full size $fullScreenSize');
    final Vector2 fullSize =
        Vector2(fullScreenSize.width, fullScreenSize.height);
    debugPrint('fullSize $fullSize');
    final Vector2 screenSize =
        Vector2(GameSetting().screenSize.x, GameSetting().screenSize.x);
    debugPrint('screenSize $screenSize');

    final double paddingY = fullSize.y - screenSize.y;
    debugPrint('paddingY $paddingY');

    final Vector2 size = Vector2(
        GameSetting().screenSize.x * 0.28, GameSetting().screenSize.x * 0.2);
    if (_selected == null) {
      return const SizedBox();
    }

    return Center(
        child: SizedBox.fromSize(
      size: Size(size.x, size.y),
      child: DecoratedBox(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/diaglog.png'),
                  fit: BoxFit.fill)),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SpriteButton.asset(
                  path: 'destroy.png',
                  pressedPath: 'destroy2.png',
                  width: 50,
                  height: 50,
                  onPressed: () {
                    _selected?.active = false;
                    _selected?.removeFromParent();
                    _selected?.gameRef.gameController
                        .send(GameEvent.weaponDestroyed(weapon: _selected!));
                    hide();
                  },
                  label: const SizedBox(),
                ),
                const Center(
                  child: Material(
                    type: MaterialType.transparency,
                    child:
                        Text('Destroy', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          )),
    ));
  }

  static WeaponComponent? _selected;

  static void show(WeaponComponent w) {
    _selected = w;
    _selected?.gameRef.overlays.add(name);
  }

  static void hide() {
    _selected?.gameRef.overlays.remove(name);
    _selected = null;
  }
}
