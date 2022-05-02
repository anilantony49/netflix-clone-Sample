import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/constants.dart';

// ignore: camel_case_types
class appbarwidget extends StatelessWidget {
  const appbarwidget({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kwidth,
        Text(
          title,
          style:
              GoogleFonts.montserrat(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        const Icon(
          Icons.cast,
          color: Color.fromARGB(255, 230, 225, 225),
          size: 30,
        ),
        kwidth,
        Container(
          width: 30,
          height: 30,
          color: Colors.white,
        ),
        kwidth,
      ],
    );
  }
}
