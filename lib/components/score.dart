import 'dart:collection';
import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:flutter_flappy_game/consts/sprite_dimentions.dart';
import 'package:flutter_flappy_game/main.dart';

class Score extends PositionComponent {
  static final double numW = size.width / 20;
  static final double numH = numW / 12 * 18;
  HashMap<String, Sprite> _digits;

  SpriteComponent _oneDigit;
  SpriteComponent _twoDigit;
  SpriteComponent _threeDigit;

  int _score = 0;

  Score()
      : _digits = HashMap.from({
          "0": Sprite.fromImage(SpriteSheet,
              width: SpirteDimentions.numberWidth,
              height: SpirteDimentions.numberHeight,
              x: SpritePosition.zeroNumberX,
              y: SpritePosition.zeroNumberY),
          "1": Sprite.fromImage(SpriteSheet,
              width: SpirteDimentions.numberWidth,
              height: SpirteDimentions.numberHeight,
              x: SpritePosition.firstNumberX,
              y: SpritePosition.firstNumberY),
          "2": Sprite.fromImage(SpriteSheet,
              width: SpirteDimentions.numberWidth,
              height: SpirteDimentions.numberHeight,
              x: SpritePosition.secondNumberX,
              y: SpritePosition.secondNumberY),
          "3": Sprite.fromImage(SpriteSheet,
              width: SpirteDimentions.numberWidth,
              height: SpirteDimentions.numberHeight,
              x: SpritePosition.thirdNumberX,
              y: SpritePosition.thirdNumberY),
          "4": Sprite.fromImage(SpriteSheet,
              width: SpirteDimentions.numberWidth,
              height: SpirteDimentions.numberHeight,
              x: SpritePosition.fourNumberX,
              y: SpritePosition.fourNumberY),
          "5": Sprite.fromImage(SpriteSheet,
              width: SpirteDimentions.numberWidth,
              height: SpirteDimentions.numberHeight,
              x: SpritePosition.fifthNumberX,
              y: SpritePosition.fifthNumberY),
          "6": Sprite.fromImage(SpriteSheet,
              width: SpirteDimentions.numberWidth,
              height: SpirteDimentions.numberHeight,
              x: SpritePosition.sixthNumberX,
              y: SpritePosition.sixthNumberY),
          "7": Sprite.fromImage(SpriteSheet,
              width: SpirteDimentions.numberWidth,
              height: SpirteDimentions.numberHeight,
              x: SpritePosition.seventhNumberX,
              y: SpritePosition.seventhNumberY),
          "8": Sprite.fromImage(SpriteSheet,
              width: SpirteDimentions.numberWidth,
              height: SpirteDimentions.numberHeight,
              x: SpritePosition.eightNumberX,
              y: SpritePosition.eightNumberY),
          "9": Sprite.fromImage(SpriteSheet,
              width: SpirteDimentions.numberWidth,
              height: SpirteDimentions.numberHeight,
              x: SpritePosition.ninethNumberX,
              y: SpritePosition.ninethNumberY)
        }) {
    _oneDigit = SpriteComponent.fromSprite(numW, numH, _digits["0"]);
    _twoDigit = SpriteComponent.fromSprite(numW, numH, _digits["0"]);
    _threeDigit = SpriteComponent.fromSprite(numW, numH, _digits["0"]);

    _oneDigit.x = numW * 8;
    _twoDigit.x = numW * 1.5;
    _threeDigit.x = numW * 1.5;

    _oneDigit.y = numH * 1.5;
  }

  void addScore() {
    _score++;
  }

  void resetScore() {
    _score = 0;
  }

  @override
  void render(Canvas c) {
    String scoreInStr = _score.toString().padLeft(3, "0");
    _oneDigit.sprite = _digits[scoreInStr[0]];
    _twoDigit.sprite = _digits[scoreInStr[1]];
    _threeDigit.sprite = _digits[scoreInStr[2]];

    _oneDigit.render(c);
    _twoDigit.render(c);
    _threeDigit.render(c);
  }
}
