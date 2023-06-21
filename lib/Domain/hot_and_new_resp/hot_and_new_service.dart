import 'package:dartz/dartz.dart';
import 'package:netflix/Domain/core/failure/main_failure.dart';
import 'package:netflix/Domain/hot_and_new_resp/models/hot_and_new_resp.dart';

abstract class HotAndNewService{
  Future <Either<MainFailure,HotAndNewResp>> getHotAndNewMovieData();
  Future <Either<MainFailure,HotAndNewResp>> getHotAndNewTvData();
}