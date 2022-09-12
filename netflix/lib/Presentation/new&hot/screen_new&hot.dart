import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:netflix/Presentation/new&hot/widget/comingsoon.dart';
import 'package:netflix/Presentation/new&hot/widget/everyoneswatching_widget.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';

import '../../Application/hot_and_new/hotandnew_bloc.dart';


class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(110),
              child: AppBar(
                  title: Text(
                    "Hot & New",
                    style: GoogleFonts.montserrat(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  actions: [
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
                  bottom: TabBar(
                      padding: const EdgeInsets.all(15),
                      isScrollable: true,
                      labelColor: kblackColor,
                      unselectedLabelColor: KwhiteColor,
                      labelStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                      indicator: BoxDecoration(
                          color: KwhiteColor, borderRadius: kRadius30),
                      tabs: const [
                        Tab(text: "🧁 Coming Soon"),
                        Tab(text: "👀 Everyone's Watching"),
                      ]))),
          body: const TabBarView(children: [
            ComingSoonList(
              key: Key('coming soon'),
            ),
            EveryonesWatchingList(key: Key('EveryOnesWatching'))
          ]),
        ));
  }
}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<HotandnewBloc>(context).add(const LoadDataInComigSoon());
    });
    return RefreshIndicator(
      onRefresh: ()async{
        BlocProvider.of<HotandnewBloc>(context).add(const LoadDataInComigSoon());
      },
      child: BlocBuilder<HotandnewBloc, HotandnewState>(
          builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        } else if (state.isError) {
          return const Center(
            child: Text('Error while loading ComingSoon List'),
          );
        } else if (state.commingSoonList.isEmpty) {
          return const Center(
            child: Text('ComingSoon List is empty'),
          );
        } else {
          return ListView.builder(
            // padding:const EdgeInsets.all(15),
              itemCount: state.commingSoonList.length,
              itemBuilder: (BuildContext context, index) {
                final movie = state.commingSoonList[index];
                //   if(movie.id==null){
                // return const SizedBox();
                //   }
                log(movie.releaseDate.toString());
                String month = '';
                String date = '';
                try {
                  final _date = DateTime.tryParse(movie.releaseDate!);
                  final formatedDate = DateFormat.yMMMMd('en_US').format(_date!);
                  log(formatedDate.toString());
                  month =
                      formatedDate.split(' ').first.substring(0, 3).toUpperCase();
    
                  date = movie.releaseDate!.split('-')[1];
                } catch (_) {
                  month = '';
                  date = '';
                }
    
                return ComingSoonWidget(
                    id: movie.id.toString(),
                    month: month,
                    day: date,
                    posterpath: '$imageappendUrl${movie.posterPath}',
                    moviename: movie.originalTitle ?? 'No Title',
                    discription: movie.overview ?? 'No description');
              });
        }
      }),
    );
  }
}

class EveryonesWatchingList extends StatelessWidget {
  const EveryonesWatchingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<HotandnewBloc>(context)
          .add(const LoadDataInEveryOnesWatching());
    });
    return RefreshIndicator(
      onRefresh: ()async{
         BlocProvider.of<HotandnewBloc>(context)
          .add(const LoadDataInEveryOnesWatching());
      },
      child: BlocBuilder<HotandnewBloc, HotandnewState>(
          builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        } else if (state.isError) {
          return const Center(
            child: Text('Error while loading ComingSoon List'),
          );
        } else if (state.everyOneIsList.isEmpty) {
          return const Center(
            child: Text('ComingSoon List is empty'),
          );
        } else {
          return ListView.builder(
            padding:const EdgeInsets.all(15),
              itemCount: state.everyOneIsList.length,
              itemBuilder: (BuildContext context, index) {
                final movie = state.everyOneIsList[index];
                // if (movie.id == null) {
                //   return const SizedBox();
                // }
                
    
                final tv = state.everyOneIsList[index];
    
                return EveryOnesWatchingWidget(
                    posterpath: '$imageappendUrl${tv.posterPath}',
                    moviename: tv.originalName ?? 'No movie name',
                    discription: tv.overview ?? 'No discription');
              });
        }
      }),
    );
  }
}
