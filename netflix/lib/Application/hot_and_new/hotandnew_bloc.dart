import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/Domain/core/failure/main_failure.dart';

import '../../Domain/hot_and_new_resp/hot_and_new_service.dart';
import '../../Domain/hot_and_new_resp/models/hot_and_new_resp.dart';

part 'hotandnew_event.dart';
part 'hotandnew_state.dart';
part 'hotandnew_bloc.freezed.dart';

@injectable
class HotandnewBloc extends Bloc<HotandnewEvent, HotandnewState> {
  final HotAndNewService _hotAndNewService;
  HotandnewBloc(this._hotAndNewService) : super(HotandnewState.initial()) {
    /*
   get hot and new movie data
   */

    on<LoadDataInComigSoon>((event, emit) async {
      //send loading to ui
      emit(const HotandnewState(
          commingSoonList: [],
          everyOneIsList: [],
          isLoading: true,
          isError: false));
      //get data from remote

      final _result = await _hotAndNewService.getHotAndNewMovieData();
      //data to state
      final newState = _result.fold((MainFailure failure) {
        return const HotandnewState(
            commingSoonList: [],
            everyOneIsList: [],
            isLoading: false,
            isError: true);
      }, (HotAndNewResp resp) {
        return HotandnewState(
            commingSoonList: resp.results,
            everyOneIsList: state.everyOneIsList,
            isLoading: false,
            isError: false);
      });
      emit(newState);
    });

    /*
   get hot and new tv data
   */

    on<LoadDataInEveryOnesWatching>((event, emit) async {
      emit(const HotandnewState(
          commingSoonList: [],
          everyOneIsList: [],
          isLoading: true,
          isError: false));
      //get data from remote

      final _result = await _hotAndNewService.getHotAndNewTvData();
      //data to state
      final newState = _result.fold((MainFailure failure) {
        return const HotandnewState(
            commingSoonList: [],
            everyOneIsList: [],
            isLoading: false,
            isError: true);
      }, (HotAndNewResp resp) {
        return HotandnewState(
            commingSoonList: state.commingSoonList,
            everyOneIsList: resp.results,
            isLoading: false,
            isError: false);
      });
      emit(newState);
    });
  }
}
