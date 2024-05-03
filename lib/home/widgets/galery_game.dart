import 'dart:io';

import 'package:flutter/material.dart';
import 'package:odyssey_platform/designWidgets/my_button.dart';
import 'package:odyssey_platform/theme/my_text_styles.dart';

class GaleryGame extends StatelessWidget {
  final String gameTitle;
  final String imageUrl;
  final String gameDescription;
  final String bash;

  const GaleryGame(
      {required this.gameTitle,
      required this.imageUrl,
      required this.gameDescription,
      required this.bash,
      super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: screenWidth * 0.15,
          width: screenWidth * 0.30,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          clipBehavior: Clip.hardEdge,
          child: Image.asset(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: screenWidth * 0.05),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(gameTitle, style: MyTextStyles.subtitles(context)),
            SizedBox(
              height: 10,
            ),
            Container(
                width: screenWidth * 0.35,
                child: Text(
                  gameDescription,
                  style: MyTextStyles.body(context),
                ))
          ],
        ),
        SizedBox(width: 10,),
        MyButton(
            onPressed: () async {
              await Process.run('bash', [bash]);
            },
            text: "Play")
      ],
    );
  }
}
