import 'package:beehoney/Classes/bee.dart';
import 'package:beehoney/Classes/sprite_model.dart';

class Spider extends SpriteModel {

  Spider() : super(name: 'spider');

  void move({required dt, required speed, required Bee bee}) {
    y += speed * dt;
    if(y > 950) {
      y = -50;
    }

    if(x < bee.x) {
      x += 2;
    }

    if(x > bee.x) {
      x -= 2;
    }
  }
}