import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/input.dart';
import 'package:flame/layout.dart';
import 'package:flutter/material.dart';
import '../../game_controller/game_event.dart';
import '../base/game_component.dart';
import '../game_main.dart';

enum ButtonState { unpressed, pressed }

class WeaponRowButtonsComponent extends GameComponent {
  WeaponRowButtonsComponent({
    required this.pos,
  });
  Vector2 pos;
  StreamSubscription? _subscription;
  Component? child;

  @override
  void onLoad() {
    child = HudMarginComponent(
        margin: const EdgeInsets.only(bottom: 64),
        children: [
          RectangleComponent(
              paint: Paint()..color = Colors.transparent,
              anchor: Anchor.center,
              position: pos,
              size: Vector2(150, 50),
              children: [
                AlignComponent(
                  alignment: Anchor.topRight,
                  child: _CancelButtonComponent(size: Vector2(50, 50)),
                ),
                AlignComponent(
                  // ignore: avoid_redundant_argument_values
                  alignment: Anchor.topLeft,
                  child: _DestoryButtonComponent(size: Vector2(50, 50)),
                ),
              ])
        ]);
    add(child!);

    _subscription = gameRef
        .gameController.repository.selectedWeaponSubject.stream
        .listen((selected) {
      if (selected == null) {
        removeFromParent();
      }
    });
    super.onMount();
  }

  @override
  void onRemove() {
    child?.removeFromParent();
    _subscription?.cancel();
    super.onRemove();
  }
}

class _DestoryButtonComponent extends SpriteGroupComponent<ButtonState>
    with HasGameRef<GameMain>, TapCallbacks {
  _DestoryButtonComponent({super.size});

  @override
  Future<void> onLoad() async {
    final pressedSprite = await game.loadSprite(
      'destroy.png',
      // srcPosition: Vector2(0, 20),
      srcSize: Vector2(68, 68),
    );
    final unpressedSprite = await game.loadSprite(
      'destroy.png',
      srcSize: Vector2(68, 68),
    );

    sprites = {
      ButtonState.pressed: pressedSprite,
      ButtonState.unpressed: unpressedSprite,
    };

    current = ButtonState.unpressed;
  }

  @override
  void onTapDown(_) {
    current = ButtonState.pressed;
    gameRef.gameController.send(const GameEvent.weaponDestroyed());
  }

  @override
  void onTapUp(_) {
    current = ButtonState.unpressed;
  }

  @override
  void onTapCancel(_) {
    current = ButtonState.unpressed;
  }
}

class _CancelButtonComponent extends SpriteGroupComponent<ButtonState>
    with HasGameRef<GameMain>, TapCallbacks {
  _CancelButtonComponent({super.size});

  @override
  Future<void> onLoad() async {
    final pressedSprite = await game.loadSprite(
      'buttons.png',
      srcPosition: Vector2(0, 20),
      srcSize: Vector2(60, 20),
    );
    final unpressedSprite = await game.loadSprite(
      'buttons.png',
      srcSize: Vector2(60, 20),
    );

    sprites = {
      ButtonState.pressed: pressedSprite,
      ButtonState.unpressed: unpressedSprite,
    };

    current = ButtonState.unpressed;
  }

  @override
  void onTapDown(_) {
    current = ButtonState.pressed;
    gameRef.gameController.send(const GameEvent.weaponUnSelected());
  }

  @override
  void onTapUp(_) {
    current = ButtonState.unpressed;
  }

  @override
  void onTapCancel(_) {
    current = ButtonState.unpressed;
  }
}
