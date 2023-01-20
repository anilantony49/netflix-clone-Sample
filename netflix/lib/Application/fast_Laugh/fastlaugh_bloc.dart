import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/Domain/downloads/i_downloads_repo.dart';
import 'package:netflix/Domain/downloads/models/downloads.dart';

part 'fastlaugh_event.dart';
part 'fastlaugh_state.dart';
part 'fastlaugh_bloc.freezed.dart';

final dummyVideoUrls = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
  "https://www.youtube.com/watch?v=-6xXuSmBox4",
];
ValueNotifier<Set<int>> likedVideosIdsNotifier = ValueNotifier({});
ValueNotifier<Set<int>> pauseVideosIdsNotifier = ValueNotifier({});

@injectable
class FastlaughBloc extends Bloc<FastlaughEvent, FastlaughState> {
  FastlaughBloc(
    IDownloadsRepo _downloadService,
  ) : super(FastlaughState.initial()) {
    on<Initialize>((event, emit) async {
      // sending loading to ui
      emit(const FastlaughState(
        videosList: [],
        isLoading: true,
        isError: false,
      ));
      //get trending movies
      final _result = await _downloadService.getDownloadsImage();
      final _state = _result.fold((l) {
        return const FastlaughState(
          videosList: [],
          isLoading: false,
          isError: true,
        );
      }, (resp) {
        return FastlaughState(
          videosList: resp,
          isLoading: false,
          isError: false,
        );
      });
      //send to ui
      emit(_state);
    });
    on<LikeVideo>((event, emit) async {
      likedVideosIdsNotifier.value.add(event.id);
      likedVideosIdsNotifier.notifyListeners();
    });
    on<UnLikeVideo>((event, emit) async {
      likedVideosIdsNotifier.value.remove(event.id);
      likedVideosIdsNotifier.notifyListeners();
    });
    on<PlayVideo>((event, emit) async {
      pauseVideosIdsNotifier.value.add(event.id);
      pauseVideosIdsNotifier.notifyListeners();
    });
    on<PauseVideo>((event, emit) async {
      pauseVideosIdsNotifier.value.remove(event.id);
      pauseVideosIdsNotifier.notifyListeners();
    });
  }
}
