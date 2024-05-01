import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:odyssey_platform/authentication/authentication_dialog.dart';
import 'dart:io';
import 'package:odyssey_platform/globals.dart' as globals;

class Carrousel extends StatefulWidget {
  final List<String> imageList;

  const Carrousel({super.key, required this.imageList});

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
                } else if (globals.signedIn.value){
                  if (imageUrl == "assets/images/fps_images/FPS-game.png") {
                    runFPSgame();
                  } else if (imageUrl ==
                      "assets/images/tennis_images/ping_pong.jpeg") {
                    runTennisGame();
                  }
                }
                else{
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

                //run .exe for game
                //             Process.run('odyssey_platform.exe', []).then((ProcessResult results) {
                //   debugPrint(results.stdout);
                // });
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image:
                        AssetImage(imageUrl), //TODO cache image to load faster
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

// Define a function to run the executable
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
