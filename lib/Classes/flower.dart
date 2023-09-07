import 'package:beehoney/Classes/sprite_model.dart';

class Flower extends SpriteModel {

  Flower() : super(name: "florwer");

  void move({required double dt, required double speed}) {
    y += speed * dt;

    if(y > 900) {
      y = -50;
      x = random(min: 50, max: 500);
    }
  }
}