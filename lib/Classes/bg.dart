import 'package:flame/components.dart';

class Bg extends SpriteComponent {

  move({deltaTime, speed, limit, posY}) {
    y += speed * deltaTime;

    if(y >= limit) {
      y = posY.toDouble();
    }
  }
}