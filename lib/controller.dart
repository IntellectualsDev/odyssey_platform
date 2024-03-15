import 'package:flutter/material.dart';
import 'package:odyssey_platform/game_selection.dart';

class Controller extends StatefulWidget {
  final Widget child;

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
                  color: Colors.blue, // Container color
                ),
                height: 50, // Container height
              ),
              Row(
                children: [
                  Container(
                    color: Colors.blue,
                    width: 100,
                    height: 500, // Container height
                  ),
                  Spacer(),
                  Container(
                    color: Colors.blue,
                    width: 100,
                    height: 500, // Container height
                  ),
                ],
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                  color: Colors.blue, // Container color
                ),
                height: 50, // Container height
              ),
            ],
          ),
        ));
  }
}
