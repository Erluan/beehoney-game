import 'package:beehoney/game/bee_honey_flame_game.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';


Future<void> main() async {
  runApp(
    GameWidget(game: BeeHoney()),
  );
}


