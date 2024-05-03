import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:odyssey_platform/designWidgets/my_button.dart';
import 'package:odyssey_platform/home/widgets/galery_game.dart';
import 'package:odyssey_platform/theme/my_colors.dart';
import 'package:odyssey_platform/theme/my_text_styles.dart';


class GamesGalleryDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Dialog(
      backgroundColor: Colors.transparent, // Make the background transparent
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: MyColors.background,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Text('Games Gallery', style: MyTextStyles.mainTitle(context)),
            SizedBox(
              height: 20,
            ),
            Container(
              height: screenHeight*0.65,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    GaleryGame(
                        gameTitle: "FPS Game",
                        imageUrl: "assets/images/fps_images/FPS-game.png",
                        gameDescription:
                            "Basic first person shooter game with basic functionality developed using raylib ",
                            bash: '/Users/pollorangel/FlutterProjects/odyssey_platform/odyssey_platform/assets/scripts/run_FPS-Game.sh',),
                    SizedBox(
                      height: screenWidth * 0.05,
                    ),
                    GaleryGame(
                        gameTitle: "Pong Game",
                        imageUrl: "assets/images/pong_images/ping_pong.jpeg",
                        gameDescription:
                            "Basic pong game implemented using sfml ",bash: '/Users/pollorangel/FlutterProjects/odyssey_platform/odyssey_platform/assets/scripts/run_Ping-Pong-Game.sh',),
                    SizedBox(
                      height: screenWidth * 0.05,
                    ),
                    GaleryGame(
                        gameTitle: "Tennis Game",
                        imageUrl: "assets/images/tennis_images/Tennis.jpg",
                        gameDescription:
                            "Improved version of the pong game",bash: '/Users/pollorangel/FlutterProjects/odyssey_platform/odyssey_platform/assets/scripts/run_Tennis-Game.sh',)
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MyButton(onPressed: (){Navigator.of(context).pop();},text: 'Close'),
          ],
        ),
      ),
    );
  }
}


