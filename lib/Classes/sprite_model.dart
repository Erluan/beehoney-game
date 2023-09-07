import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class SpriteModel extends SpriteComponent{
  String name;
  int timer;
  int img;

  SpriteModel({
    required this.name,
    this.timer = 1,
    this.img = 1,
  });

  void animate({required int timerLimit, required int spriteLimit}) async {
    timer += 1;
    if(timer > timerLimit) {
      timer = 0;
      img += 1;
    }

    if(img > spriteLimit) {
      img = 1;
    }

    sprite = await Sprite.load("$name${img.toString()}.png");
  }

  double random({required double min, required double max}) {
    Random r = Random();
    return min + r.nextInt(max.toInt() - min.toInt());
  }
}