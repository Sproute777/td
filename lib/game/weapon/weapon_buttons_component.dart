import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:flame/input.dart';
import 'package:flame/layout.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import '../../game_controller/domain/game_repository.dart';
import '../../game_controller/game_event.dart';
import '../game_main.dart';
import '../util/priority.dart';

enum ButtonState { unpressed, pressed }

mixin MixinWeaponButtons on PositionComponent {
  PositionComponent? cancelButton;
  PositionComponent? destroyButton;
  PositionComponent? emptyButton;
  StreamSubscription? _subscription;
  bool buttonShown = false;

  void showMenu(GameRepository repository) {
    if (buttonShown) {
      return;
    }

    buttonShown = true;
    EffectController duration(double x) => EffectController(duration: x);
    final half = size * 0.5;
    final initMargin = EdgeInsets.only(bottom: half.y, right: half.x);

    /// T0D0 add in other overlay
    cancelButton = HudMarginComponent(margin: initMargin, children: [
      CancelButtonComponent(
        size: Vector2(50, 50),
        priority: Priority.overlay,
      ),
    ]);
    destroyButton = HudMarginComponent(margin: initMargin, children: [
      DestroyButtonComponent(
        size: Vector2(50, 50),
        priority: Priority.overlay,
      ),
    ]);
    emptyButton = HudMarginComponent(margin: initMargin, children: [
      EmptyButtonComponent(
        size: Vector2(50, 50),
        priority: Priority.overlay,
      ),
    ]);
    cancelButton
      ?..add(
        MoveEffect.to(Vector2(-half.x, -half.y - 5), duration(0.5)),
      )
      ..add(RotateEffect.to(-0.1, duration(0.3)));
    emptyButton?.add(SequenceEffect([
      MoveEffect.to(Vector2(half.x, -half.y - 10), duration(0.5)),
    ]));
    destroyButton
      ?..add(
        MoveEffect.to(Vector2(half.x * 3, -half.y - 5), duration(0.5)),
      )
      ..add(RotateEffect.to(0.1, duration(0.3)));
    add(cancelButton!);
    add(emptyButton!);
    add(destroyButton!);

    _subscription?.cancel();
    _subscription = repository.selectedWeaponSubject.stream.listen((selected) {
      if (selected == null) {
        debugPrint('Remove from parent');
        destroyButton?.removeFromParent();
        cancelButton?.removeFromParent();
        emptyButton?.removeFromParent();
        buttonShown = false;
      }
    });
  }

  @override
  void onRemove() {
    _subscription?.cancel();
    super.onRemove();
  }
}

class DestroyButtonComponent extends SpriteGroupComponent<ButtonState>
    with HasGameRef<GameMain>, TapCallbacks {
  DestroyButtonComponent({super.size, super.priority})
      : super(anchor: Anchor.center);

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
    add(
      RectangleComponent(
        paint: Paint()..color = Colors.transparent,
        size: size,
        children: [
          AlignComponent(
            alignment: const Anchor(.3, .3),
            child: TextComponent(text: 'Destroy', textRenderer: _buttonText),
          )
        ],
      ),
    );
  }

  @override
  void onTapDown(event) {
    current = ButtonState.pressed;
    gameRef.gameController.send(const GameEvent.weaponDestroyed());
  }

  @override
  void onTapUp(event) {
    current = ButtonState.unpressed;
  }

  @override
  void onTapCancel(event) {
    current = ButtonState.unpressed;
  }
}

class CancelButtonComponent extends SpriteGroupComponent<ButtonState>
    with HasGameRef<GameMain>, TapCallbacks {
  CancelButtonComponent({super.size, super.priority})
      : super(anchor: Anchor.center);

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
    add(
      RectangleComponent(
        paint: Paint()..color = Colors.transparent,
        size: size,
        children: [
          AlignComponent(
            alignment: const Anchor(.3, .3),
            child: TextComponent(text: 'Cancel', textRenderer: _buttonText),
          )
        ],
      ),
    );
  }

  @override
  void onTapDown(event) {
    current = ButtonState.pressed;
    gameRef.gameController.send(const GameEvent.weaponUnSelected());
  }

  @override
  void onTapUp(event) {
    current = ButtonState.unpressed;
  }

  @override
  void onTapCancel(event) {
    current = ButtonState.unpressed;
  }
}

class EmptyButtonComponent extends SpriteGroupComponent<ButtonState>
    with HasGameRef<GameMain>, TapCallbacks {
  EmptyButtonComponent({super.size, super.priority})
      : super(anchor: Anchor.center);

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
    add(
      RectangleComponent(
        paint: Paint()..color = Colors.transparent,
        size: size,
        children: [
          AlignComponent(
            alignment: const Anchor(.3, .3),
            child: TextComponent(text: 'Empty', textRenderer: _buttonText),
          )
        ],
      ),
    );
  }

  @override
  void onTapDown(event) {
    current = ButtonState.pressed;
  }

  @override
  void onTapUp(event) {
    current = ButtonState.unpressed;
  }

  @override
  void onTapCancel(event) {
    current = ButtonState.unpressed;
  }
}

final _buttonText = TextPaint(
    style: TextStyle(
  fontSize: 14,
  color: BasicPalette.black.color,
));
