import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/Application/search/search_bloc.dart';

import 'package:netflix/Presentation/search/search_widget/title.dart';

import 'package:netflix/core/constants.dart';



class searchReasult extends StatelessWidget {
  const searchReasult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const searchTilewidget(title: 'Movies & Tv'),
            kheight,
            Expanded(
              child: BlocBuilder<SearchBloc,SearchState>(
                builder: (context, state) {
                  
                return GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1 / 1.35,
                  children: List.generate(
                    20,
                    (index) {
                      final movie = state.searchResultList[index];
                      return MainCard(
                        imageUrl:movie.posterImageUrl);
                    },
                      ),
                   
                  );
                },
                
              ),
            ),
          ],
        ));
  }
}

class MainCard extends StatelessWidget {
  final String imageUrl;
  const MainCard({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // color: Colors.red,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            )));
  }
}
 