import 'package:flutter/material.dart';
import 'package:netflix/Presentation/widgets/custom_widget.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 600,
          width: double.infinity,
          // color: Colors.red,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(imageUrls))),
        ),
        Positioned(
          bottom: 15,
          left: 0,
          right: 0,
          //top: 0,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            const CustomIconWIdget(
              icon: Icons.add,
              title: 'Mylist',
            ),
            _playbutton(),
            const CustomIconWIdget(icon: Icons.info_outline, title: 'Info')
          ]),
        )
      ],
    );
  }

  TextButton _playbutton() {
    return TextButton.icon(
      onPressed: () {},
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(KwhiteColor)),
      icon: const Icon(
        Icons.play_arrow,
        size: 25,
        color: kblackColor,
      ),
      label: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          'Play',
          style: TextStyle(color: kblackColor, fontSize: 20),
        ),
      ),
    );
  }
}
