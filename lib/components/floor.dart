import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/position.dart';
import 'package:flame/sprite.dart';
import 'package:flutter_flappy_game/main.dart';

class Floor extends Component {
  Sprite _floorSprite = Sprite("floor.png");
  double xSize = 0;
  double ySize = 0;
  double xPos = 0;

  @override
  void render(Canvas c) {
    xSize = size.width * 2;
    ySize = size.width / 168 * 56;
    _floorSprite.renderPosition(c, Position(xPos, size.height - ySize * 0.25),
        size: Position(xSize, ySize));
  }

  @override
  void update(double t) {
    xPos -= t * 50;
    if (xPos.abs() >= size.width) {
      xPos = 0;
    }
  }

  Rect toRect() {
    return Rect.fromLTWH(0, size.height - ySize * 0.25, xSize, ySize);
  }
}
