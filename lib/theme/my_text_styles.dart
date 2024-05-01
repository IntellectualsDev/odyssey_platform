import 'package:flutter/material.dart';
import 'package:odyssey_platform/theme/my_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextStyles {
  static double _getScreenHeight(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.height;
    return screenWidth;
  }

  static TextStyle superTitle(BuildContext context) {
    return TextStyle(
      fontSize: _getScreenHeight(context) * 0.1,
      fontWeight: FontWeight.w900,
      color: Colors.white,
    );
  }

  static TextStyle mainTitle(BuildContext context) {
    return GoogleFonts.trispace(
        textStyle: TextStyle(
      fontSize: _getScreenHeight(context) * 0.05,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ));
  }

  static TextStyle subtitles(BuildContext context) {
    return GoogleFonts.trispace(
        textStyle: TextStyle(
      fontSize: _getScreenHeight(context) * 0.05,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ));
  }

  static TextStyle body(BuildContext context) {
    return GoogleFonts.trispace(
        textStyle: TextStyle(
      fontSize: _getScreenHeight(context) *
          0.02, // Example: Font size is 80% of headline1
      color: Colors.white,
    ));
  }

  static TextStyle bodyDark(BuildContext context) {
    return GoogleFonts.trispace(
        textStyle: TextStyle(
      fontSize: _getScreenHeight(context) *
          0.02, // Example: Font size is 80% of headline1
      color: Colors.black,
    ));
  }

  static TextStyle buttonText(BuildContext context) {
    return GoogleFonts.trispace(
        textStyle: TextStyle(
      fontSize: _getScreenHeight(context) *
          0.025, // Example: Font size is 60% of headline1
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ));
     
  }

  static TextStyle textButton(BuildContext context) {
    return GoogleFonts.trispace(
        textStyle: TextStyle(
      fontSize: _getScreenHeight(context) *
          0.02, // Example: Font size is 80% of headline1
      color: MyColors.action,
    ));
  }

  static TextStyle underlinedButton(BuildContext context) {
    return GoogleFonts.trispace(
        textStyle: TextStyle(
      fontSize: _getScreenHeight(context) *
          0.025, // Example: Font size is 80% of headline1
      color: MyColors.action,
      decoration: TextDecoration.underline,
      decorationColor: MyColors.action, // Color of the underline
      decorationThickness: 2,
    ));
  }

  static TextStyle errorMessage(BuildContext context) {
    return TextStyle(
      fontSize: _getScreenHeight(context) *
          0.02, // Example: Font size is 60% of headline1
      fontWeight: FontWeight.normal,
      color: Colors.red,
    );
  }

  // Add more text styles as needed...
}
