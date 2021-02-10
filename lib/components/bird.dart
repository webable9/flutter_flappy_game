import 'package:flame/anchor.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/flame.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_flappy_game/main.dart';

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
    //timepassed += t;
    speedY += GRAVITY * t;
    this.anchor = Anchor.center;
    //this.y = size.height / 2;
    //this.y = timepassed * 30;
    //this.y = (GRAVITY * timepassed * timepassed) / 2;
    this.y += (speedY * t) / 2;
    this.x = size.width / 2;
    //print(timepassed);
  }

  void onTap() {
    //print("user tap!!");
    //this.y = 0.0;
    //this.timepassed = 0;
    this.speedY = -500;
    Flame.audio.play("bubble_pop.mp3", volume: 0.5);
  }
}
