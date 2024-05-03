import 'package:flutter/material.dart';
import 'package:odyssey_platform/theme/my_colors.dart';
import 'package:odyssey_platform/theme/my_text_styles.dart';


class MyButton extends StatelessWidget {
final VoidCallback onPressed;
final String text;

  const MyButton({
    required this.onPressed,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: MyColors.action),
      onPressed: onPressed,
      child: Text(
        text,
        style: MyTextStyles.buttonText(context),
      ),
    );
  }
}