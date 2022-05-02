import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/Domain/core/failure/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix/Domain/hot_and_new_resp/hot_and_new_service.dart';
import 'package:netflix/Domain/hot_and_new_resp/models/hot_and_new_resp.dart';

import '../../Domain/core/api_endpoints.dart';

@LazySingleton(as:HotAndNewService)
class HotAndNewImplementation implements HotAndNewService{ 
  @override
   Future<Either<MainFailure, HotAndNewResp>> getHotAndNewMovieData() async{
  try {
      final Response response = await Dio(BaseOptions())
          .get(ApiEndPoint.hotandnewMovies,);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNewResp.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.ServerFailure());
      }
    }on DioError 
     catch (e) {
      log(e.toString());
      return const Left(MainFailure.ClientFailure());
    } catch (e) {
       log(e.toString());
       return const Left(MainFailure.ClientFailure());
    }
  }

  @override
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewTvData() async{
    try {
      final Response response = await Dio(BaseOptions())
          .get(ApiEndPoint.hotandnewTv,);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNewResp.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.ServerFailure());
      }
    }on DioError 
     catch (e) {
      log(e.toString());
      return const Left(MainFailure.ClientFailure());
    } catch (e) {
       log(e.toString());
       return const Left(MainFailure.ClientFailure());
    }
  }
  
}