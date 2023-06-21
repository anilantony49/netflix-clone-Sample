import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

class MainCard1 extends StatelessWidget {
  final String ImageUrl;
  const MainCard1({
    Key? key,
    required this.ImageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 8),
      margin: const EdgeInsets.all(4),
      width: 130,
      height: 280,

      // color: Colors.red,
      decoration: BoxDecoration(
          borderRadius: kRadius10,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                ImageUrl,
              ))),
    );
  }
}
