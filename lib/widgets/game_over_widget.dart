import 'package:beehoney/game/scenes/levels/bee_honey_flame_game.dart';
import 'package:beehoney/game/scenes/menus/main_menu.dart';
import 'package:beehoney/game/utils/utils.dart';
import 'package:flutter/material.dart';

Widget gameOverWidget(BuildContext buildContext, BeeHoney game) {
  return GestureDetector(
    onTap: () {
      gameOver = false;
      score = 0;
      lives = 3;
      Navigator.push(buildContext,
      MaterialPageRoute(builder: (buildContext) => const MainMenu()));
    },
    child: SizedBox(
      width: 500,
      height: 900,
      child: Image.asset(
        "assets/images/gameover.png",
        fit: BoxFit.fill,
      ),
    ),
  );
}
