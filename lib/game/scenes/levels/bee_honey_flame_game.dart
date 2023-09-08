import 'package:beehoney/Classes/bee.dart';
import 'package:beehoney/Classes/bg.dart';
import 'package:beehoney/Classes/flower.dart';
import 'package:beehoney/Classes/game_text.dart';
import 'package:beehoney/Classes/spider.dart';
import 'package:beehoney/game/utils/utils.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flame/palette.dart';
import 'package:flutter/services.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class BeeHoney extends FlameGame with KeyboardEvents, HasCollisionDetection {
  Bg bg = Bg();
  Bg bg2 = Bg();
  Bee bee = Bee();
  Spider spider = Spider();
  Flower flower = Flower();

  GameText textScore = GameText(text: "Score: ", x: 10, y: 10, color: BasicPalette.black.color);
  GameText textLives = GameText(text: "Lives: ", x: 300, y: 10, color: BasicPalette.black.color);

  @override
  Future<void>? onLoad() async {
    bg
      ..sprite = await Sprite.load("bg.png")
      ..size.x = 400
      ..size.y = 900
      ..position = Vector2(0, 0);

    add(bg);

    bg2
      ..sprite = await Sprite.load("bg.png")
      ..size.x = 400
      ..size.y = 900
      ..position = Vector2(0, -900);

    add(bg2);

    bee
      ..sprite = await Sprite.load("bee1.png")
      ..size = Vector2.all(50)
      ..position = Vector2(195, 760)
      ..anchor = Anchor.center
      ..add(RectangleHitbox());

    add(bee);

    spider
      ..sprite = await Sprite.load("spider1.png")
      ..size = Vector2.all(80)
      ..position = Vector2(250, 500)
      ..anchor = Anchor.center
      ..add(RectangleHitbox());

    add(spider);

    flower
      ..sprite = await Sprite.load("florwer1.png")
      ..size = Vector2.all(30)
      ..position = Vector2(200, 400)
      ..anchor = Anchor.center
      ..add(RectangleHitbox());

    add(flower);

    add(textScore);
    add(textLives);

    return super.onLoad();
  }

  @override
  void update(double dt) {
    bg.move(deltaTime: dt, speed: 100, limit: 900, posY: 0);
    bg2.move(deltaTime: dt, speed: 100, limit: 0, posY: -900);

    bee.move(dt: dt, speed: 10);
    bee.animate(timerLimit: 8, spriteLimit: 4);

    spider.move(dt: dt, speed: 80, bee: bee);
    spider.animate(timerLimit: 8, spriteLimit: 4);

    flower.move(dt: dt, speed: 200);
    flower.animate(timerLimit: 8, spriteLimit: 2);

    if(gameOver) {
      pauseEngine();
      overlays.add("GameOver");
    }

    textScore.text = scoreLabel + score.toString();
    textLives.text = livesLabel + lives.toString();

    super.update(dt);
  }

  @override
  KeyEventResult onKeyEvent(
      RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (event.data.keyLabel == "a") {
      bee.left = !bee.left ? true : false;
    }


    if (event.data.keyLabel == "d") {
      bee.right = !bee.right ? true : false;
    }
    return super.onKeyEvent(event, keysPressed);
  }
}