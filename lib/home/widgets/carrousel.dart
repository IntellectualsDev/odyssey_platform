import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:io';

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
        int index = widget.imageList.indexOf(imageUrl); //index of the current page
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () {
                if (_currentIndex != index) { //if the user presses on a page that is not the one in the center then move that page to the center
                  _carouselController.animateToPage(index); 
                }

                runExecutable();
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
void runExecutable() async {
  // Path to your executable file within the assets folder
  String executablePath = "/Users/pollorangel/FlutterProjects/odyssey_platform/odyssey_platform/assets/games/FPS-Game";
  // Get the path of the executable file
  String appDir = Directory.current.path;
  debugPrint(appDir);
  String fullPath = '$appDir/$executablePath';

  // Check if the file exists
  if (await File(executablePath).exists()) {
    // Run the executable file
    Process.run(executablePath, []).then((ProcessResult results) {
      print("Process exited with code ${results.exitCode}");
      print(results.stdout);
      print(results.stderr);
    }).catchError((error) {
      print("Error running executable: $error");
    });
  } else {
    print("Executable file not found at $fullPath");
  }
}