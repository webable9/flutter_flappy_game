import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flappy_game/my_game.dart';

Size size;
var SpriteSheet;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  size = await Flame.util.initialDimensions();
  SpriteSheet = await Flame.images.load("sprites.png");
  runApp(MyGame().widget);
}
