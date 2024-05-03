import 'package:flutter/material.dart';
import 'package:odyssey_platform/theme/my_colors.dart';

class DecorativeBox extends StatelessWidget {

  Widget content; 

   DecorativeBox({super.key, required this.content });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: MyColors.action),
      child: Container(
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 3),
                blurRadius: 4,
                color: MyColors.background,
              ),
            ],
            color: MyColors.background,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(20),
          child: content),
    );
  }
}
