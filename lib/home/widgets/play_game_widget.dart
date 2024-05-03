import 'dart:io';

import 'package:flutter/material.dart';
import 'package:odyssey_platform/designWidgets/my_button.dart';
import 'package:odyssey_platform/designWidgets/video_container.dart';
import 'package:odyssey_platform/theme/my_colors.dart';
import 'package:odyssey_platform/theme/my_text_styles.dart';

class PlayGameWidget extends StatelessWidget {
  final String imageUrl;
  final String gameName;
  final String gameDescription;
  final String bash;
  final String videoUrl;

  const PlayGameWidget(
      {super.key,
      required this.imageUrl,
      required this.gameName,
      required this.gameDescription,
      required this.bash,
      required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double dialogWidth = screenWidth * 0.8;
    double dialogHeight = screenHeight * 0.8;
    double paddingBetween = screenHeight*0.01;

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        height: dialogHeight,
        width: dialogWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: MyColors.background,
        ),
        child: Center(
            child: Column(
          children: [
            SizedBox(
              height: paddingBetween,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.close,
                  color: Colors.transparent,
                ),
                Spacer(),
                Text(
                  gameName,
                  style: MyTextStyles.mainTitle(context),
                ),
                Spacer(),
                IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                  },
                ),
              ],
            ),
            SizedBox(
              height: paddingBetween,
            ),
            Container(
              width: dialogWidth * 0.9,
              height: dialogHeight * 0.7,
              child: VideoContainer(videoUrl: videoUrl,),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            ),
            SizedBox(
              height: paddingBetween,
            ),
            Container(
              width: dialogWidth*0.8,
              child: Text(
                gameDescription,
                style: MyTextStyles.body(context),
              ),
            ),
            SizedBox(
              height: paddingBetween,
            ),
            MyButton(
                onPressed: () async {
                  await Process.run('bash', [bash]);
                },
                text: 'Play'),
            SizedBox(
              height: paddingBetween,
            )
          ],
        )),
      ),
      // child: Stack(
      //                 children: [
      //                   Container(
      //                     height: dialogHeight,
      //                     width: dialogWidth,
      //                     decoration: BoxDecoration(
      //                       borderRadius: BorderRadius.circular(8.0),
      //                       image: DecorationImage(
      //                         image: AssetImage(imageUrl),
      //                         fit: BoxFit.cover,
      //                       ),
      //                     ),
      //                   ),

      //                 ],
      //               )
    );
  }
}
