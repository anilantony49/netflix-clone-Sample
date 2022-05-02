import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

class CustomIconWIdget extends StatelessWidget {
  final IconData icon;
  final String title;
  final double textSize;
  final double iconsize;
  const CustomIconWIdget({
    Key? key,
    required this.icon,
    required this.title,
    this.textSize = 16,
    this.iconsize = 33,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: KwhiteColor,
          size: iconsize,
        ),
        Text(
          title,
          style: TextStyle(fontSize: textSize),
        ),
      ],
    );
  }
}
