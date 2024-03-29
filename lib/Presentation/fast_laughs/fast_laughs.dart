import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/Application/fast_Laugh/fastlaugh_bloc.dart';
import 'package:netflix/Presentation/fast_laughs/widget/video_listitem.dart';



class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<FastlaughBloc>(context).add(const Initialize());
    });
    return Scaffold(body: SafeArea(
      child: BlocBuilder<FastlaughBloc, FastlaughState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.isError) {
            return const Center(
              child: Text('Error while getting Data'),
            );
          } else if (state.videosList.isEmpty) {
            return const Center(
              child: Text('Video List is empty'),
            );
          } else {
            return PageView(
                scrollDirection: Axis.vertical,
                children: List.generate(state.videosList.length, (index) {
                  return VideoListItemInheritedWidget(
                    widget:
                        VideoListItem(key: Key(index.toString()), index: index,),
                    movieData: state.videosList[index],
                  );
                }));
          }
        },
      ),
    ));
  }
}
