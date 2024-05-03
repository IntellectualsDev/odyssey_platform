import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:odyssey_platform/authentication/authentication_dialog.dart';
import 'dart:io';
import 'package:odyssey_platform/globals.dart' as globals;
import 'package:odyssey_platform/home/widgets/play_game_widget.dart';
import 'package:odyssey_platform/theme/my_text_styles.dart';

class Carrousel extends StatefulWidget {
  final List<String> imageList;
  final List<String> gameList;

  const Carrousel({super.key, required this.imageList, required this.gameList});

  @override
  State<Carrousel> createState() => _CarrouselState();
}

class _CarrouselState extends State<Carrousel> {
  int _currentIndex = 0; //keep track of the current item in the middle
  CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double imageHeight = screenHeight / 2.2;

    return CarouselSlider(
      carouselController: _carouselController,
      options: CarouselOptions(
        enlargeFactor: 0.5,
        height: imageHeight,
        enlargeCenterPage: true,
        initialPage: 0,
        autoPlay: true,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayInterval: Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(milliseconds: 2000),
        viewportFraction: 0.5,
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      items: widget.imageList.map((imageUrl) {
        int index =
            widget.imageList.indexOf(imageUrl); //index of the current page
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () {
                if (_currentIndex != index) {
                  //if the user presses on a page that is not the one in the center then move that page to the center
                  _carouselController.animateToPage(index);
                } else if (globals.signedIn.value) {
                  if (imageUrl == "assets/images/fps_images/FPS-game.png") {
                    openPlayGameWidget(context, imageUrl, "FPS Game",
                        "Basic first person shooter game with basic functionality developed using raylib",'/Users/pollorangel/FlutterProjects/odyssey_platform/odyssey_platform/assets/scripts/run_FPS-Game.sh');
                    //runFPSgame();
                  } else if (imageUrl ==
                      "assets/images/pong_images/ping_pong.jpeg") {
                    openPlayGameWidget(context, imageUrl, "Pong Game",
                        "Basic pong game implemented using sfml",'/Users/pollorangel/FlutterProjects/odyssey_platform/odyssey_platform/assets/scripts/run_Ping-Pong-Game.sh');

                    //runPongGame();
                  } else if (imageUrl ==
                      "assets/images/tennis_images/Tennis.jpg") {
                    openPlayGameWidget(context, imageUrl, "Tennis Game",
                        "Improved version of the pong game",'/Users/pollorangel/FlutterProjects/odyssey_platform/odyssey_platform/assets/scripts/run_Tennis-Game.sh');

                   // runTennisGame();
                  }
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AuthenticationDialog(
                          message: "Please log in to play the games",
                          screenWidth: screenWidth,
                          screenHeight: screenHeight);
                    },
                  );
                }
              },
              child: (_currentIndex == index)
                  ? Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: AssetImage(imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.black.withOpacity(0.5),
                          ),
                          child: Center(
                              child: Text(
                            widget.gameList.elementAt(index),
                            style: MyTextStyles.mainTitle(context),
                          )),
                        ),
                      ],
                    )
                  : Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage(
                              imageUrl), //TODO cache image to load faster
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
            );
          },
        );
      }).toList(),
    );
  }
}

void openPlayGameWidget(BuildContext context, String imageUrl, String gameName,
    String gameDescription, String bash) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return PlayGameWidget(
        imageUrl: imageUrl,
        gameName: gameName,
        gameDescription: gameDescription,
        bash: bash,
      ); // Replace YourDialogWidget() with the widget you want to show as a dialog
    },
  );
}

// Define a function to run the executable
void runPongGame() async {
  // Path to your executable file within the assets folder
  String executablePath = "./odyssey_platform/assets/games/FPS-Game";
  // Get the path of the executable file
  String appDir = Directory.current.path;
  debugPrint(appDir);
  String fullPath = '$appDir/$executablePath';

  // Check if the file exists
  // if (await File(executablePath).exists()) {
  // Run the executable file
  // Execute the bash script
  var result = await Process.run('bash', [
    '/Users/pollorangel/FlutterProjects/odyssey_platform/odyssey_platform/assets/scripts/run_Ping-Pong-Game.sh'
  ]);

  // Check if the process was successful
  if (result.exitCode == 0) {
    print('Executable started successfully.');
  } else {
    print('Error starting executable: ${result.stderr}');
  }
//}
}

// Define a function to run the executable
void runFPSgame() async {
  // Path to your executable file within the assets folder
  String executablePath = "./odyssey_platform/assets/games/FPS-Game";
  // Get the path of the executable file
  String appDir = Directory.current.path;
  debugPrint(appDir);
  String fullPath = '$appDir/$executablePath';

  // Check if the file exists
  // if (await File(executablePath).exists()) {
  // Run the executable file
  // Execute the bash script
  var result = await Process.run('bash', [
    '/Users/pollorangel/FlutterProjects/odyssey_platform/odyssey_platform/assets/scripts/run_FPS-Game.sh'
  ]);

  // Check if the process was successful
  if (result.exitCode == 0) {
    print('Executable started successfully.');
  } else {
    print('Error starting executable: ${result.stderr}');
  }
//}
}

void runTennisGame() async {
  // Path to your executable file within the assets folder
  String executablePath = "./odyssey_platform/assets/games/FPS-Game";
  // Get the path of the executable file
  String appDir = Directory.current.path;
  debugPrint(appDir);
  String fullPath = '$appDir/$executablePath';

  // Check if the file exists
  // if (await File(executablePath).exists()) {
  // Run the executable file
  // Execute the bash script
  var result = await Process.run('bash', [
    '/Users/pollorangel/FlutterProjects/odyssey_platform/odyssey_platform/assets/scripts/run_Tennis-Game.sh'
  ]);

  // Check if the process was successful
  if (result.exitCode == 0) {
    print('Executable started successfully.');
  } else {
    print('Error starting executable: ${result.stderr}');
  }
//}
}
