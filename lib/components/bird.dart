import 'package:flame/anchor.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/flame.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_flappy_game/game_state.dart';
import 'package:flutter_flappy_game/main.dart';
import 'package:flutter_flappy_game/options.dart';

final double BIRD_W = 52;
final double BIRD_H = 36.7;
final double GRAVITY = 1200;

class Bird extends AnimationComponent {
  //Bird.sequenced(double width, double height, String imagePath, int amount)
  Bird()
      : super.sequenced(BIRD_W, BIRD_H, 'bird.png', 3,
            textureWidth: 17, textureHeight: 12);

  //double timepassed = 0.0;
  double speedY = 0.0;

  @override
  void update(double t) {
    super.update(t);
    this.anchor = Anchor.center;

    switch (gameState) {
      case GameState.pause:
        // TODO: Handle this case.
        this.y = size.height * 0.4;
        this.x = size.width / 2;
        break;
      case GameState.play:
        //timepassed += t;
        speedY += (GRAVITY + GAME_SPEED) * t;
        //this.y = size.height / 2;
        //this.y = timepassed * 30;
        //this.y = (GRAVITY * timepassed * timepassed) / 2;
        this.y += (speedY * t) / 2;
        this.x = size.width / 2;
        //print(timepassed);
        break;
      case GameState.gameover:
        break;
    }
  }

  void onTap() {
    switch (gameState) {
      case GameState.pause:
        this.speedY = -500;
        Flame.audio.play("bubble_pop.mp3", volume: 0.5);
        break;
      case GameState.play:
        //print("user tap!!");
        //this.y = 0.0;
        //this.timepassed = 0;
        this.speedY = -500;
        Flame.audio.play("bubble_pop.mp3", volume: 0.5);
        break;
      case GameState.gameover:
        break;
    }
  }
}
