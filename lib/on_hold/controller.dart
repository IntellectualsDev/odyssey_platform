import 'package:flutter/material.dart';
import 'package:odyssey_platform/game_selection.dart';
import 'package:odyssey_platform/on_hold/controller_button.dart';

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

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(
                    0, 3), // Adjust the offset to control the shadow direction
              ),
            ],
            
          ),
          //color: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch ,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors
                          .grey[900]!, // Lighter color for the metallic effect
                      Colors.grey[800]!, // Base color for the metallic effect
                      Colors.grey[700]!, // Darker color for the metallic effect
                    ],
                    stops: [
                      0.1,
                      0.5,
                      0.9
                    ], // Adjust the stops to control the metallic effect
                  ),
                ),
                height: 20, // Container height
              ),
              Row(
                children: [
                  Container(
                      width: 150,
                      height: 450,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.grey[
                                900]!, // Lighter color for the metallic effect
                            Colors.grey[
                                800]!, // Base color for the metallic effect
                            Colors.grey[
                                700]!, // Darker color for the metallic effect
                          ],
                          stops: const [
                            0.1,
                            0.5,
                            0.9
                          ], // Adjust the stops to control the metallic effect
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ControllerButton(
                            letter: "Y",
                            color: Colors.yellow,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ControllerButton(
                                letter: 'B',
                                color: Colors.red,
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              ControllerButton(
                                letter: 'X',
                                color: Colors.blue,
                              )
                            ],
                          ),
                          ControllerButton(letter: 'A', color: Colors.green),
                        ],
                      )),
                  Expanded(
                      child: Container(
                    height: 450,
                    color: Colors.amber,
                    child: Center(child: Text("Content")),
                  )),
                  Container(
                      width: 150,
                      height: 450,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.grey[
                                700]!, // Lighter color for the metallic effect
                            Colors.grey[
                                800]!, // Base color for the metallic effect
                            Colors.grey[
                                900]!, // Darker color for the metallic effect
                          ],
                          stops: const [
                            0.1,
                            0.5,
                            0.9
                          ], // Adjust the stops to control the metallic effect
                        ),
                      ),
                      child: const Column(
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
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors
                          .grey[700]!, // Lighter color for the metallic effect
                      Colors.grey[800]!, // Base color for the metallic effect
                      Colors.grey[900]!, // Darker color for the metallic effect
                    ],
                    stops: [
                      0.1,
                      0.5,
                      0.9
                    ], // Adjust the stops to control the metallic effect
                  ),
                ),
                height: 20,
              ),
            ],
          )),
    );
  }
}
