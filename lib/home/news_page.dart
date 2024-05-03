import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:odyssey_platform/designWidgets/decorative_box.dart';
import 'package:odyssey_platform/designWidgets/typewriter_text.dart';
import 'package:odyssey_platform/home/widgets/carrousel.dart';
import 'package:odyssey_platform/home/widgets/carrousel_image.dart';
import 'package:odyssey_platform/nav_bar/NavBar.dart';
import 'package:odyssey_platform/side_bar.dart';
import 'package:odyssey_platform/theme/my_colors.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:overlapped_carousel/overlapped_carousel.dart';
import 'package:odyssey_platform/theme/my_text_styles.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

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
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "The Odyssey \n Project",
                            style: MyTextStyles.superTitle(context).copyWith(
                              shadows: [
                                Shadow(
                                  // Outline color
                                  color: MyColors.action,
                                  blurRadius: 20, // Outline width
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              width: screenWidth / 1.5,
                              child: TypewriterText(
                                  text: "Start your journey",
                                  fontSize: screenWidth * 0.06,
                                  isBold: true)),
                          const SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 40, right: 40, top: 10, bottom: 10),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: MyColors.background,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        "The Platform",
                                        style: MyTextStyles.subtitles(context),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: Colors.blue,
                                          width: 2,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Text(
                                          'Our project introduces the Odyssey, an innovative gaming platform aiming to revolutionize the game development field for people that are just starting. With our platform new game developers can send us their compiled games for us to add to our platfrom where users from all over the world can play our games',
                                          style: MyTextStyles.body(context),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: screenWidth * 0.15,
                                      ),
                                      Text(
                                        "FPS Game",
                                        style: MyTextStyles.buttonText(context),
                                      ),
                                      const Spacer(),
                                      Text(
                                        "Tennis Game",
                                        style: MyTextStyles.buttonText(context),
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.13,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: screenWidth * 0.05,
                                      ),
                                      Container(
                                        height: screenWidth * 0.2,
                                        width: screenWidth * 0.30,
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        clipBehavior: Clip.hardEdge,
                                        child: Image.asset(
                                          "assets/images/fps_images/FPS-game.png",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const Spacer(),
                                      Container(
                                        height: screenWidth * 0.2,
                                        width: screenWidth * 0.30,
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        clipBehavior: Clip.hardEdge,
                                        child: Image.asset(
                                          "assets/images/tennis_images/Tennis.jpg",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.05,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  
                                  SizedBox(height: 5,),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: screenWidth * 0.09,
                                      ),
                                      Text(
                                        "By Joseph Bartoszczyk",
                                        style: MyTextStyles.body(context),
                                      ),
                                      const Spacer(),
                                      Text(
                                        "By Nitin Nagarkar",
                                        style: MyTextStyles.body(context),
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.12,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20,),
                                  
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
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
