import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:odyssey_platform/theme/my_colors.dart';
import 'package:odyssey_platform/globals.dart' as globals;


class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {

    return Container(
      color: Color.fromRGBO(128, 128, 128, 0.2),
      child: Column(
        children: [BarButton(selected: false, icon: Icons.home),Spacer(),Text("hello")],
      ),
    );
  }
}

class BarButton extends StatelessWidget {
  bool selected;
  IconData icon;

  BarButton({super.key, required this.selected, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
       (selected) ? Container(
          width: 5,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white, // Color of the rectangle
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20)), // Adjust radius as needed
          ),
        ):Container(),
        const SizedBox(
          width: 20,
        ),
        IconButton(
            onPressed: () => {},
            icon: Icon(
              icon,
              color: Colors.white,
            )),
        SizedBox(
          width: 25,
        )
      ],
    );
  }
}
