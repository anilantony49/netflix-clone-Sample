import 'package:flutter/material.dart';
import 'package:netflix/Presentation/Downloada/widgets/bottam_nav.dart';
import 'package:netflix/Presentation/downloads/downloads.dart';
import 'package:netflix/Presentation/fast_laughs/fast_laughs.dart';
import 'package:netflix/Presentation/home/screen_home.dart';
import 'package:netflix/Presentation/new&hot/screen_new&hot.dart';
import 'package:netflix/Presentation/search/search.dart';
import 'package:netflix/core/colors/colors.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({Key? key}) : super(key: key);
  final _pages = [
    ScreenHome(),
    const screenNewAndHot(),
    const screenFastLaugh(),
    screenSearch(),
    screenDownloads()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backGroundColor,
        body: SafeArea(
          child: ValueListenableBuilder(
              valueListenable: indexChangeNotifier,
              builder: (BuildContext ctx, int index, Widget? _) {
                return _pages[index];
              }),
        ),
        bottomNavigationBar: const bottomNavigationBarWidget());
  }
}
