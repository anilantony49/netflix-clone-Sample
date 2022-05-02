
import 'package:dartz/dartz.dart';
import 'package:netflix/Domain/core/failure/main_failure.dart';
import 'package:netflix/Domain/search/models/search_response/search_response.dart';

abstract class SearchService{
  Future<Either<MainFailure,SearchResponse>> searchMovies({
    required String movieQuery,
  });
}