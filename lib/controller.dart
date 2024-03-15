import 'package:flutter/material.dart';
import 'package:odyssey_platform/game_selection.dart';
import 'package:odyssey_platform/controller_button.dart';

class Controller extends StatefulWidget {
  final Widget child;
//<a href="https://www.freepik.com/free-photo/leather-macro-shot_1161875.htm#query=leather%20texture&position=1&from_view=keyword&track=ais&uuid=a0a9ae1d-3b43-429e-b54c-e954d3a8c3c6">Image by nikitabuida</a> on Freepik
  const Controller({super.key, required this.child});

  @override
  State<Controller> createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  color: Colors.blue,
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/leatherTexture.jpg'), // Replace 'assets/texture_image.png' with your texture image path
                    fit: BoxFit.cover,
                  ),
                ),
                height: 20, // Container height
              ),
              Row(
                children: [
                  Container(
                      width: 150,
                      height: 550,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/leatherTexture.jpg'), // Replace 'assets/texture_image.png' with your texture image path
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor:
                                Colors.black, // Color of the circle
                            radius: 15, // Radius of the circle
                            child: Text(
                              'Y', // Letter inside the circle
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow, // Color of the letter
                                fontSize: 15, // Font size of the letter
                              ),
                            ),
                          ),
                          Row(
                            children: [],
                          ),
                          ControllerButton(),
                        ],
                      )),
                  Expanded(
                      child: Container(
                    height: 550,
                    color: Colors.amber,
                    child: Center(child: Text("Content")),
                  )),
                  Container(
                      width: 150,
                      height: 550,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/leatherTexture.jpg'), // Replace 'assets/texture_image.png' with your texture image path
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor:
                                Colors.black, // Color of the circle
                            radius: 15, // Radius of the circle
                            child: Text(
                              'Y', // Letter inside the circle
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow, // Color of the letter
                                fontSize: 15, // Font size of the letter
                              ),
                            ),
                          ),
                          Row(
                            children: [],
                          ),
                          CircleAvatar(
                            backgroundColor:
                                Colors.black, // Color of the circle
                            radius: 15, // Radius of the circle
                            child: Text(
                              'A', // Letter inside the circle
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green, // Color of the letter
                                fontSize: 15, // Font size of the letter
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
              
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                    
                  ),
                  image: DecorationImage(
                          image: AssetImage(
                              'assets/leatherTexture.jpg'), // Replace 'assets/texture_image.png' with your texture image path
                          fit: BoxFit.cover,
                        ),
                  color: Colors.blue,
                ),
                height: 20,
              ),
            ],
          ),
        ));
  }
}


