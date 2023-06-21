import 'package:flutter/material.dart';

class Maintitle extends StatelessWidget {
  final String title;
  const Maintitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,

      // textAlign: TextAlign.end,
      style: const TextStyle(
          color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
    );
  }
}
