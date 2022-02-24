import 'package:flame/components.dart';

class Bg extends SpriteComponent {
  move(dt, speed, limit, posY) {
    y += speed * dt;

    if(y >= 730) {
      y = posY.toDouble();
    }
  }
}