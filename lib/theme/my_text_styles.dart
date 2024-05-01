import 'package:flutter/material.dart';

class MyTextStyles {
  static double _getScreenHeight(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.height;
    return screenWidth;
  }

  static TextStyle mainTitle(BuildContext context) {
    return TextStyle(
      fontSize: _getScreenHeight(context)*0.05,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
  }

  static TextStyle body(BuildContext context) {
    return TextStyle(
      fontSize: _getScreenHeight(context) * 0.02, // Example: Font size is 80% of headline1
      color: Colors.white,
    );
  }

  static TextStyle bodyDark(BuildContext context) {
    return TextStyle(
      fontSize: _getScreenHeight(context) * 0.02, // Example: Font size is 80% of headline1
      color: Colors.black,
    );
  }

  static TextStyle buttonText(BuildContext context) {
    return TextStyle(
      fontSize: _getScreenHeight(context) * 0.025, // Example: Font size is 60% of headline1
      fontWeight: FontWeight.normal,
      color: Colors.white,
    );
  }

    static TextStyle errorMessage(BuildContext context) {
    return TextStyle(
      fontSize: _getScreenHeight(context) * 0.02, // Example: Font size is 60% of headline1
      fontWeight: FontWeight.normal,
      color: Colors.red,
    );
  }

  // Add more text styles as needed...
}
