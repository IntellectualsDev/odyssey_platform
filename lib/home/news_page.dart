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

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'), // Replace 'background_image.jpg' with your image file
              fit: BoxFit.cover, // Adjust the fit as needed
            ),
          ),
          child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
          const SideBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  StickyHeader(
                    header:
                        const NavBar(),
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
              ),
        ));
  }
}
