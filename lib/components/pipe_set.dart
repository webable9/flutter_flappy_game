import 'dart:math';
import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/position.dart';
import 'package:flame/sprite.dart';
import 'package:flutter_flappy_game/main.dart';
import 'package:flutter_flappy_game/options.dart';

class PipeSet extends Component {
  static double pipeH = size.height / 12 * 7;
  static double pipeW = pipeH / 160 * 26;
  static double pipeGap = 4;

  Sprite _pipeUp = Sprite("pipe_up.png");
  Sprite _pipeDown = Sprite("pipe_down.png");

  double pipePos = size.width;
  int pipeLevel = 1;

  @override
  void render(Canvas c) {
    _pipeUp.renderPosition(c, Position(pipePos, pipeH / 7 * (pipeLevel - 7)),
        size: Position(pipeW, pipeH));
    _pipeDown.renderPosition(
        c, Position(pipePos, pipeH / 7 * (pipeLevel + pipeGap)),
        size: Position(pipeW, pipeH));
  }

  @override
  void update(double t) {
    if (pipePos < -pipeW) {
      pipePos = size.width;
      pipeLevel = Random().nextInt(5);
      if (pipeLevel == 0) {
        pipeLevel = 6;
      }
    }
    pipePos -= t * (30 + GAME_SPEED);
  }
}
