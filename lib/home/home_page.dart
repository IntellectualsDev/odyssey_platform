import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:odyssey_platform/nav_bar/NavBar.dart';
import 'package:odyssey_platform/side_bar.dart';
import 'package:odyssey_platform/theme/my_colors.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
        double width = MediaQuery.of(context).size.width;

    return Scaffold(

      body:Row(children: [SideBar()],)
    );
  }
}
