import 'dart:ui';

import 'package:flame/game/base_game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/sprite.dart';
import 'package:flutter_flappy_game/components/bird.dart';
import 'package:flame/components/component.dart';
import 'package:flutter_flappy_game/components/floor.dart';
import 'package:flutter_flappy_game/main.dart';

class MyGame extends BaseGame with TapDetector {
  Bird _bird;
  Floor _floor;

  MyGame() {
    _bird = Bird();
    _floor = Floor();
    this
      ..add(
          SpriteComponent.fromSprite(size.width, size.height, Sprite("bg.png")))
      ..add(_bird)
      ..add(_floor);
  }

  @override
  void update(double t) {
    super.update(t);

    if (checkIf2CompoCollision(_bird.toRect(), _floor.toRect())) {
      print("Game Over");
    }
  }

  @override
  void onTap() {
    super.onTap();
    _bird.onTap();
  }

  bool checkIf2CompoCollision(Rect item1, Rect item2) {
    var intersectedRect = item1.intersect(item2);
    return intersectedRect.width > 2 && intersectedRect.height > 2;
  }
}