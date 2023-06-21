

import 'package:flutter/material.dart';
import 'package:netflix/Presentation/widgets/custom_widget.dart';
import 'package:netflix/Presentation/widgets/videoWidget.dart';
import 'package:netflix/core/constants.dart';

class EveryOnesWatchingWidget extends StatelessWidget {
  final String posterpath;
  final String moviename;
  final String discription;

  const EveryOnesWatchingWidget(
      {Key? key,
      required this.posterpath,
      required this.moviename,
      required this.discription})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
         Text(
          moviename,
          style:const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        kheight,
        Text(
          
         discription,
         maxLines: 4,
         overflow: TextOverflow.ellipsis,
          style:const TextStyle(color: Colors.grey),
        ),
        k50height,
       VideoWidget(url:posterpath),
        kheight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            CustomIconWIdget(
              icon: Icons.share,
              iconsize: 25,
              title: 'Share',
              textSize: 17,
            ),
            kwidth,
            CustomIconWIdget(
              icon: Icons.add,
              iconsize: 25,
              title: 'My List',
              textSize: 17,
            ),
            kwidth,
            CustomIconWIdget(
              icon: Icons.play_arrow,
              iconsize: 25,
              title: 'Play',
              textSize: 17,
            ),
            kwidth,
          ],
        )
      ]),
    );
  }
}
