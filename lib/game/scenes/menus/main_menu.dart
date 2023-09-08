import 'package:beehoney/game/scenes/levels/bee_honey_flame_game.dart';
import 'package:beehoney/widgets/game_over_widget.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GameWidget(
                game: BeeHoney(),
                overlayBuilderMap: const {"GameOver" : gameOverWidget},
              ),
            ),
          );
        },
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.asset(
            "assets/images/start.png",
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
