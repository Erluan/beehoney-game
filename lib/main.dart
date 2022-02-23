import 'package:flame/game.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  runApp(
    GameWidget(game: BeeHoney()),
  );
}

class BeeHoney extends FlameGame {

}