import 'package:flutter/material.dart';
import 'package:netflix/Presentation/fast_laughs/widget/main_title.dart';
import 'package:netflix/Presentation/home/number_card.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Maintitle(title: 'Top 10 Tv Shows in India Today'),
        ),
        // kheight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                  10,
                  (index) => NumberCard(
                        index: index,
                      ))),
        )
      ],
    );
  }
}
