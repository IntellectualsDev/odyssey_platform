import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:odyssey_platform/designWidgets/TypewriterText.dart';
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
                            padding: const EdgeInsets.all(10),
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
                                      Text("The Platform", style: MyTextStyles.subtitles(context),),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(),
                                ],
                              ),
                            ),
                          )
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
