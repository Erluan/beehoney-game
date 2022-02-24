import 'package:beehoney/Classes/bg.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  runApp(
    GameWidget(game: BeeHoney()),
  );
}

class BeeHoney extends FlameGame with KeyboardEvents {

  Bg bg = Bg();
  Bg bg2 = Bg();
  SpriteComponent bee = SpriteComponent();

  @override
  Future<void>? onLoad() async {
    bg
      ..sprite = await Sprite.load("bg.png")
      ..size.x = 415
      ..size.y = 730
      ..position = Vector2(0, 0);

    add(bg);

    bg2
      ..sprite = await Sprite.load("bg.png")
      ..size.x = 415
      ..size.y = 730
      ..position = Vector2(0, -730);

    add(bg2);

    bee
      ..sprite = await Sprite.load("bee1.png")
      ..size = Vector2.all(50)
      ..position = Vector2(250, 250)
      ..anchor = Anchor.center;

    add(bee);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    bg.move(dt, 100, 730, 0);
    bg2.move(dt, 100, 0, -730);
    super.update(dt);

  }

  // @override
  // KeyEventResult onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
  //   if(event.data.keyLabel == "a") {
  //     bee.x -= 1;
  //   }
  //   if(event.data.keyLabel == "d") {
  //     bee.x += 1;
  //   }
  //   return super.onKeyEvent(event, keysPressed);
  // }

}

