import 'package:movie_db/data/api/models/movie_card_model.dart';
import 'package:movie_db/data/api/models/movie_detail_model.dart';
import 'package:movie_db/utils/result.dart';

abstract interface class MoviesService {
  Future<Result<List<MovieCardModel>>> getPopularMoviesAPI();
  Future<Result<List<MovieCardModel>>> getTrendingMoviesAPI();
  Future<Result<List<MovieCardModel>>> getTopRatedMoviesAPI();
  Future<Result<MovieDetailModel>> getMovieDetailsAPI(int id);
  Future<Result<List<MovieCardModel>>> searchMoviesAPI(String title);
}
