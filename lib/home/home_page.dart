import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:odyssey_platform/home/widgets/carrousel.dart';
import 'package:odyssey_platform/home/widgets/carrousel_image.dart';
import 'package:odyssey_platform/nav_bar/NavBar.dart';
import 'package:odyssey_platform/side_bar.dart';
import 'package:odyssey_platform/theme/my_colors.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:overlapped_carousel/overlapped_carousel.dart';

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
// appBar: PreferredSize(
//           preferredSize: Size.fromHeight(100.0), // Adjust the height here
//           child: AppBar(
//             actions: [Text('Custom App Bar Height')],
//             automaticallyImplyLeading: false, //dissable back button
//           ),
//         ),
        body: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SideBar(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                StickyHeader(
                  header:
                      const NavBar(), //only show the navigation bar if the app bar is not there so just when the display is big enough
                  content: SizedBox(
                    width:
                        MediaQuery.of(context).size.width, // or a fixed width
                    child: const Column(
                      children: [
                        Carrousel(imageList: [
                          "assets/images/games/game1.png",
                          "assets/images/games/game2.png",
                          "assets/images/games/game3.png"
                        ])
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
