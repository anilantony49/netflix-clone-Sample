//  import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:netflix/Presentation/search/search_widget/search_idle.dart';
import 'package:netflix/Presentation/search/search_widget/search_result.dart';

import 'package:netflix/core/constants.dart';
import 'package:netflix/core/debounce/debounce.dart';

import '../../Application/search/search_bloc.dart';

class screenSearch extends StatelessWidget {
  screenSearch({Key? key}) : super(key: key);

  final _debouncer = Debouncer(milliseconds: 1 * 1000);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(const Initialize());
    });
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoSearchTextField(
                backgroundColor: Colors.grey.withOpacity(.25),
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  color: Colors.grey,
                ),
                suffixIcon: const Icon(CupertinoIcons.xmark_circle_fill,
                    color: Colors.grey),
                style: const TextStyle(color: Colors.white),
                onChanged: (value) {
                  if (value.isEmpty) {
                    return;
                  }
                  _debouncer.run(() {
                    BlocProvider.of<SearchBloc>(context)
                        .add(SearchMovie(movieQuery: value));
                  });
                }),
            kheight,
            Expanded(child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state.searchResultList.isEmpty) {
                  return const searchIdleWidget();
                } else {
                  return const searchReasult();
                }
              },
            )),
            // Expanded(child: const searchReasult()) ,
          ],
        ),
      )),
    );
  }
}
