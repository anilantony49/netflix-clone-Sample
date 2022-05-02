import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

class NumberCard extends StatelessWidget {
  final int index;
  const NumberCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 30,
              height: 150,
            ),
            Container(
              // padding: EdgeInsets.symmetric(horizontal: 8),
              margin: const EdgeInsets.all(4),
              width: 130,
              height: 280,
              // color: Colors.red,
              decoration: BoxDecoration(
                  borderRadius: kRadius10,
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://sm.ign.com/t/ign_in/gallery/s/spider-man/spider-man-far-from-home-official-movie-posters_epch.1080.jpg"))),
            ),
          ],
        ),
        Positioned(
          left: 0,
          bottom: 0,
          top: 80,
          // right: -30,
          child: BorderedText(
            strokeCap: StrokeCap.round,
            strokeJoin: StrokeJoin.round,
            strokeWidth: 8,
            strokeColor: Colors.grey,
            child: Text(
              '${index + 1}',
              style: const TextStyle(
                  fontSize: 115,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        )
      ],
    );
  }
}
