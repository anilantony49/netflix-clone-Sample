import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/Application/Home/home_bloc.dart';
import 'package:netflix/Presentation/widgets/Background_card.dart';
import 'package:netflix/Presentation/widgets/main_title_card.dart';
import 'package:netflix/Presentation/widgets/number_title_card.dart';
import 'package:netflix/core/constants.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({Key? key}) : super(key: key);

  ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
          BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
    });

    
     return Scaffold(
          body: ValueListenableBuilder(
              valueListenable: scrollNotifier,
              builder: (BuildContext context, bool index, _) {
                return NotificationListener<UserScrollNotification>(
                  onNotification: (notification) {
                    final ScrollDirection direction = notification.direction;
                    print(direction);
                    if (direction == ScrollDirection.reverse) {
                      scrollNotifier.value = false;
                    } else if (direction == ScrollDirection.forward) {
                      scrollNotifier.value = true;
                    }

                    return true;
                  },
                  child: Stack(
                    children: [
                      BlocBuilder<HomeBloc, HomeState>(
                        builder: (context, state) {
                          if (state.pastYearMovieList.isEmpty||state.southIndianMovieList.isEmpty||
                                 state.tenseDramasMOvieList.isEmpty||state.trendingMovieList.isEmpty
                               ||state.trendingTvList.isEmpty) {
                               return const Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            );
                           } 
                          else if (state.hasError) {
                            return const Center(
                              child: Text('Error while getting Data'),
                            );
                          }
                          final _releasedInThePastYear =
                              state.pastYearMovieList.map((m) {
                            return '$imageappendUrl${m.posterPath}';
                          }).toList();
                           _releasedInThePastYear.shuffle();
                          final _trending = state.trendingMovieList.map((m) {
                            return '$imageappendUrl${m.posterPath}';
                          }).toList();
                           _trending.shuffle();
                          final _tenseDrama = state.tenseDramasMOvieList.map((m) {
                            return '$imageappendUrl${m.posterPath}';
                          }).toList();
                          _tenseDrama.shuffle();
                          final _southIndianMovies =
                              state.southIndianMovieList.map((m) {
                            return '$imageappendUrl${m.posterPath}';
                          }).toList();
                          _southIndianMovies.shuffle();

                            //top 10 tv shows 

                            final _top10Tvshows= state.trendingTvList.map((m) {
                             return '$imageappendUrl${m.posterPath}';
                            }).toList();
                            _top10Tvshows.shuffle();
                              print(_top10Tvshows.length);
                          return ListView(
                            children: [
                              const BackgroundCard(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    MainCardTitle(
                                        title: 'Released in the past year',
                                        posterList: _releasedInThePastYear
                                            .sublist(0, 10)),
                                    kheight,
                                    MainCardTitle(
                                        title: 'Trending Now',
                                        posterList: _trending.sublist(0, 10)),
                                    kheight,
                                     NumberTitleCard(
                                      postersList:_top10Tvshows.sublist(0, 10),
                                    ),
                                    kheight,
                                    MainCardTitle(
                                        title: 'Tense Dramas',
                                        posterList: _tenseDrama.sublist(0, 10)),
                                    kheight,
                                    MainCardTitle(
                                        title: 'South Indian Cinima',
                                        posterList:
                                            _southIndianMovies.sublist(0, 10)),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      scrollNotifier.value == true
                          ? AnimatedContainer(
                              duration: const Duration(milliseconds: 1000),
                              child: Container(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Image.network(
                                          "https://i.pinimg.com/originals/75/5a/b3/755ab365fbaed60c05bb3312a78edccf.jpg",
                                          //  color:Colors.red,
                                          width: 80,
                                          height: 60,
                                        ),
                                        const Spacer(),
                                        const Icon(
                                          Icons.cast,
                                          color:
                                              Color.fromARGB(255, 230, 225, 225),
                                          size: 30,
                                        ),
                                        kwidth,
                                        Container(
                                          width: 30,
                                          height: 30,
                                          color: Colors.white,
                                        ),
                                        kwidth
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'Tv Shows',
                                          style: khomeTextStle,
                                        ),
                                        Text('Movies', style: khomeTextStle),
                                        Text('Categories', style: khomeTextStle),
                                      ],
                                    )
                                  ],
                                ),
                                width: double.infinity,
                                height: 90,
                                color: Colors.black.withOpacity(.8),
                              ),
                            )
                          : kheight,
                    ],
                  ),
                );
              }));
    
  }
}
