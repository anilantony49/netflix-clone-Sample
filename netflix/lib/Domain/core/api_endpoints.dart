import 'package:netflix/Infarstructure/api_key.dart';
import 'package:netflix/core/strings.dart';

class ApiEndPoint {
  static const downloads = "$kbaseUrl/trending/all/day?api_key=$apiKey";
  static const search = "$kbaseUrl/search/movie?api_key=$apiKey";
  static const hotandnewMovies = "$kbaseUrl/discover/movie?api_key=$apiKey";
  static const hotandnewTv = "$kbaseUrl/discover/tv?api_key=$apiKey";
}
