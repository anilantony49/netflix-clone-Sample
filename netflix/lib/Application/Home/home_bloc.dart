import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/Domain/core/failure/main_failure.dart';
import 'package:netflix/Domain/hot_and_new_resp/hot_and_new_service.dart';

import '../../Domain/hot_and_new_resp/models/hot_and_new_resp.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';


@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HotAndNewService _homeService;
  HomeBloc(this._homeService) : super(HomeState.initial()) {

    /*
    on event get homescreen data
    */
    on<GetHomeScreenData>((event, emit) async {
      //send loading to UI

      emit(state.copyWith(isLoading: true,hasError: false));

      //get Data
    final _movieResult=await  _homeService.getHotAndNewMovieData();
    final _tvMovie=await _homeService.getHotAndNewTvData();
      
      //transform Data
   final _state1=  _movieResult.fold((MainFailure failure) {
       return  HomeState(
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
         pastYearMovieList: [], 
         trendingMovieList: [], 
         tenseDramasMOvieList: [], 
         southIndianMovieList:[], 
         trendingTvList: [], 
         isLoading: false, 
         hasError: true);
     }, (HotAndNewResp resp) {
      final pastYear=resp.results;
      final trending=resp.results;
      final dramas=resp.results;
      final southIndian=resp.results;
  
       pastYear.shuffle();
       trending.shuffle();
       dramas.shuffle();
       southIndian.shuffle();

        return  HomeState(
           stateId: DateTime.now().millisecondsSinceEpoch.toString(),
         pastYearMovieList: pastYear, 
         trendingMovieList: southIndian, 
         tenseDramasMOvieList: southIndian, 
         southIndianMovieList:southIndian, 
         trendingTvList: state.trendingTvList, 
         isLoading: false, 
         hasError: false);
     });
     emit(_state1);

   final _state2 =  _tvMovie.fold((MainFailure failure) {
       return  HomeState(
         stateId: DateTime.now().millisecondsSinceEpoch.toString(),
         pastYearMovieList: [], 
         trendingMovieList: [], 
         tenseDramasMOvieList: [], 
         southIndianMovieList:[], 
         trendingTvList: [], 
         isLoading: false, 
         hasError: true);
     }, (HotAndNewResp resp) {
        final top10List=resp.results;
         return  HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
         pastYearMovieList: state.pastYearMovieList, 
         trendingMovieList: state.trendingMovieList, 
         tenseDramasMOvieList: state.tenseDramasMOvieList, 
         southIndianMovieList:state.southIndianMovieList, 
         trendingTvList:top10List, 
         isLoading: false, 
         hasError: false);
     });
      //send to UI
      emit(_state2);
    });
  }
}
