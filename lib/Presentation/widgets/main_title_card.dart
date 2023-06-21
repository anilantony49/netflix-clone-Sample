import 'package:flutter/material.dart';
import 'package:netflix/Presentation/fast_laughs/widget/main_title.dart';
import 'package:netflix/Presentation/widgets/main_card.dart';

class MainCardTitle extends StatelessWidget {
  final String title;
  final List<String>posterList;
  const MainCardTitle({
    Key? key,
    required this.title, required this.posterList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Maintitle(title: title),
        ),
        // kheight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
              posterList.length,
                (index) =>  MainCard1(ImageUrl: posterList[index]),
              )),
        )
      ],
    );
  }
}
