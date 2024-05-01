import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:odyssey_platform/authentication/authentication_dialog.dart';
import 'package:odyssey_platform/home/widgets/carrousel.dart';
import 'package:odyssey_platform/home/widgets/carrousel_image.dart';
import 'package:odyssey_platform/nav_bar/NavBar.dart';
import 'package:odyssey_platform/side_bar.dart';
import 'package:odyssey_platform/theme/my_colors.dart';
import 'package:odyssey_platform/theme/my_text_styles.dart';
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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'assets/images/background.png'), // Replace 'background_image.jpg' with your image file
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
                    header: const NavBar(),
                    content: SizedBox(
                      width:
                          MediaQuery.of(context).size.width, // or a fixed width
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Best games",
                                style: MyTextStyles.subtitles(context),
                              ),
                              Spacer(),
                              TextButton(
                                  onPressed: openGalery,
                                  child: Text("view all",
                                      style: MyTextStyles.underlinedButton(
                                          context))),
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Carrousel(imageList: [
                            "assets/images/fps_images/FPS-game.png",
                            "assets/images/tennis_images/ping_pong.jpeg",
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

  void openGalery() {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
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
}
