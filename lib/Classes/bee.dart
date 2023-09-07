import 'package:beehoney/Classes/flower.dart';
import 'package:beehoney/Classes/spider.dart';
import 'package:beehoney/Classes/sprite_model.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class Bee extends SpriteModel with CollisionCallbacks {
  bool right;
  bool left;

  Bee({
    this.left = false,
    this.right = false,
  }) : super(name: 'bee');

  void move({required double dt, required double speed}) {
    if(right) {
      if(x <= 360) {
        x += speed;
      }
    }

    if(left) {
      if(x >= 30) {
        x -= speed;
      }
    }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);

    if(other is Spider) {
      other.position.y = -100;
    }

    if(other is Flower) {
      other.position.y = -100;
      other.position.x = Flower().random(min: 50, max: 500);
    }
  }

}